import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';
import 'dart:io';



class Firm extends StatefulWidget{
    @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<Firm> {
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
        title: new Center(child: new Text("Dibuje su firma", textAlign: TextAlign.center))
      ),
    
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
                      
                      alignment: Alignment.bottomLeft, heightFactor: 13.5, 
                      child: new FloatingActionButton(
                        elevation: 10,
                        heroTag: null,
                        child: new Icon(Icons.refresh),
                        onPressed: () => _points.clear(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight, heightFactor: 13.5, 
                      child: new FloatingActionButton(
                        elevation: 10,
                        heroTag: null,
                        child: 
                        new Icon(Icons.check),
                        onPressed: saveSignature,
                      ),
                    ),
                  ],
        ) ,
        )
    );
    
      
       
  
    
  }
  saveSignature() async {
    
    RenderRepaintBoundary boundary = screen.currentContext.findRenderObject();

    if (boundary.debugNeedsPaint) {
      print("Waiting for boundary to be painted.");
      await Future.delayed(const Duration(milliseconds: 20));
      return saveSignature();
    }
    

    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();// La variable pngBytes, tiene los valores que conforman la imagen de la firma del padre en forma de array...La idea es pasar el array con la api y despues transformarlo a png(No es dificil!). 
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