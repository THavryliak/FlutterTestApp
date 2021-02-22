import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Solid Software Test",
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: MyHomePage(title: "Solid Software Test"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> _gradColors = [Colors.white, Colors.white];

  Color colorGenerator() {
    return Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256),
        Random().nextInt(256)
    );
  }

  void _colorChange() {
    setState(() {
      _gradColors = List.generate(2, (index) => colorGenerator());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: Image.asset(
            'images/solid_logo.png',
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _gradColors,
              )
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _colorChange();
            },
            child: Center(
              child: Text(
                "Hey there!\nTap me to see the magic :)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        )
    );
  }
}
