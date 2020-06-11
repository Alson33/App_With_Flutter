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
          // FIXME: USe of good color (not too important right now)
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
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    iconSize: 35.0,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: controller,
                    ),
                    onPressed: () => _onpressed(),
                    // TODO: Adding the navigation to another page.
                  ),
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
            MainHomePagePart(),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        // FIXME: Use the correct icon
                        child: Icon(Icons.add_shopping_cart),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text('Info.......'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Text('Info.......'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        // FIXME: Use the correct icon
                        child: Icon(Icons.accessibility),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainHomePagePart extends StatefulWidget {
  const MainHomePagePart({
    Key key,
  }) : super(key: key);

  @override
  _MainHomePagePartState createState() => _MainHomePagePartState();
}

class _MainHomePagePartState extends State<MainHomePagePart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                // TODO: Adding bottle or glass icon rather than text.
                child: Text('For the bottle or glass'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Table(
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            // TODO: Make the icons work.
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {},
                            ),
                            Text('2'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            // TODO: Make the icons work.
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {},
                            ),
                            Text('1'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Container(
                        child: Text('Add Bottles'),
                      ),
                      Container(
                        child: Text('Add hours to remind'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
