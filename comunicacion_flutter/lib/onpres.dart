
<<<<<<< HEAD
class a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gesture Demo';

    return MaterialApp(
      title: title,
      home: b(title: title),
    );
  }
}

class b extends StatelessWidget {
  final String title;

  b({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: c()),
    );
  }
}

class c extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Nuestro GestureDetector envuelve nuestro botón
    return GestureDetector(
      // Cuando el hijo reciba un tap, muestra un snackbar
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      // Nuestro botón personalizado!
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('My Button'),
      ),
    );
  }
}
=======
>>>>>>> Nicaor_Flutter
