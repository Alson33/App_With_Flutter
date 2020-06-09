import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  // HomePage({Key key}) : super (key: Key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;
  bool isPlaying = false;

  _onpressed() {
    if (isPlaying == false) {
      isPlaying = true;
      controller.forward();
    } else {
      isPlaying = false;
      controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();

    var animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    controller = animationController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 0.9),
            colors: <Color>[
              Colors.deepOrangeAccent,
              // Colors.amber,
              Colors.purple,
              Colors.blueAccent,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  iconSize: 35.0,
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: controller,
                  ),
                  onPressed: () => _onpressed(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Drink',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
