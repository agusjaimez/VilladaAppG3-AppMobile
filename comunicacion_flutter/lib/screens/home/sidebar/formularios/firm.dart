import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:comunicacion/screens/home/sidebar/formularios/pdfview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Firm extends StatefulWidget {
  final String nombre;
  final String apellido;
  final String justificacion;
  final String date;

  const Firm(
      {Key key, this.nombre, this.apellido, this.justificacion, this.date})
      : super(key: key);
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<Firm> {
  final pdf = pw.Document();

  GlobalKey screen = new GlobalKey();
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        key: screen,
        child: new Scaffold(
          extendBodyBehindAppBar: true,
          appBar: new AppBar(
              centerTitle: true,
              title: new Center(
                  child: new Text("Dibuje su firma",
                      textAlign: TextAlign.center))),
          body: Stack(
            children: <Widget>[
              new GestureDetector(
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    RenderBox object = context.findRenderObject();
                    Offset _localPosition =
                        object.globalToLocal(details.globalPosition);
                    _points = new List.from(_points)..add(_localPosition);
                  });
                },
                onPanEnd: (DragEndDetails details) => _points.add(null),
                child: new CustomPaint(
                  painter: new Signature(points: _points),
                  size: Size.infinite,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                heightFactor: 13.5,
                child: new FloatingActionButton(
                  elevation: 10,
                  heroTag: null,
                  child: new Icon(Icons.refresh),
                  onPressed: () => _points.clear(),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                heightFactor: 13.5,
                child: new FloatingActionButton(
                    elevation: 10,
                    heroTag: null,
                    child: new Icon(Icons.check),
                    onPressed: () async {
                      saveSignature();
                      redactarPdf();
                      await guardarPdf();
                      Directory documentDirectory =
                          await getApplicationSupportDirectory();
                      String documentPath = documentDirectory.path;
                      String fullPath = "$documentPath/example.pdf";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfView(path: fullPath),
                          ));
                    }),
              ),
            ],
          ),
        ));
  }

  redactarPdf() async {
    var myTheme = pw.ThemeData.withFont(
      base: pw.Font.ttf(await rootBundle.load("fonts/OpenSans-Bold.ttf")),
    );
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        theme: myTheme,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Paragraph(text: widget.nombre.toString()),
            pw.Paragraph(text: widget.apellido.toString()),
            pw.Paragraph(text: widget.justificacion.toString()),
            pw.Paragraph(text: widget.date.toString()),
            
          ];
        }));
  }

  guardarPdf() async {
    Directory documentDirectory = await getApplicationSupportDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync(pdf.save());
  }

  saveSignature() async {
    RenderRepaintBoundary boundary = screen.currentContext.findRenderObject();
    if (boundary.debugNeedsPaint) {
      print("Waiting for boundary to be painted.");
      await Future.delayed(const Duration(milliseconds: 20));
      return saveSignature();
    }
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);

    // La variable pngBytes, tiene los valores que conforman la imagen de la firma del padre en forma de array...La idea es pasar el array con la api y despues transformarlo a png(No es dificil!).
    //final path = '$directory/screenshot.png';
    //File imgFile =new File(path);
    //imgFile.writeAsBytes(pngBytes);
    //var filePath = await ImagePickerSaver.saveFile( fileData:byteData.buffer.asUint8List());
  }
}

class Signature extends CustomPainter {
  List<Offset> points;
  Signature({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}
