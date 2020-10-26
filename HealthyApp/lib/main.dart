import 'package:HealthyApp/services/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customPaints/customPaints.dart';
import 'widgets/repeatedWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Settings>(
            create: (context) => Settings(),
          ),
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            // FIXME: Try to make animated transition
            CustomPaint(
              painter: UpperSmallCircle(context: context),
              size: Size.fromHeight(200),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomPaint(
                painter: LowerBigCircle(context: context),
                size: Size.fromHeight(370),
              ),
            ),
            Column(
              children: <Widget>[
                TitleWidget(title: 'Drink', color: Colors.white),
                HomePageMainPart(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageMainPart extends StatefulWidget {
  HomePageMainPart({
    Key key,
  }) : super(key: key);

  @override
  _HomePageMainPartState createState() => _HomePageMainPartState();
}

class _HomePageMainPartState extends State<HomePageMainPart> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    // final settingArgs = Provider.of<Settings>(context);
    return Consumer<Settings>(
      builder: (context, settingArgs, child) {
        return Expanded(
          flex: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        for (int i = 1; i <= _count; i++)
                          Expanded(
                            child: ImageIcon(
                              settingArgs.isBottle
                                  ? AssetImage('assets/icons/bottle.ico')
                                  : AssetImage('assets/icons/glass.ico'),
                              size: settingArgs.isBottle ? 350.0 : 400.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[100].withOpacity(0.2),
                      ),
                      child: IconButton(
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        padding: EdgeInsets.all(20),
                        icon: Icon(
                          Icons.settings,
                        ),
                        iconSize: MediaQuery.of(context).size.width * .08,
                        onPressed: () {
                          _showSettingBottomSheet(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void _showSettingBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            BottomSheetTitle(
              title: 'Choose a medium:',
            ),
            Row(
              children: [
                ChangeNotifierProvider(
                  create: (context) => Settings(),
                  child: Consumer<Settings>(
                    builder: (context, value, child) {
                      return CircularOptions(asset: 'bottle');
                    },
                  ),
                ),
                ChangeNotifierProvider(
                  create: (context) => Settings(),
                  child: Consumer<Settings>(
                    builder: (context, value, child) {
                      return CircularOptions(asset: 'glass');
                    },
                  ),
                ),
              ],
            ),
            BottomSheetTitle(
              title: 'No of bottles:',
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('1'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('2'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('3'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('4'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('5'),
                    ),
                  ),
                ],
              ),
            ),
            BottomSheetTitle(
              title: 'Remind me in:',
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('10min'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('30min'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('50min'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Text('60min'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('90min'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class CircularOptions extends StatefulWidget {
  const CircularOptions({
    Key key,
    this.asset,
  }) : super(key: key);

  final String asset;

  static bool sentBottle;
  static String selectedIcon;

  @override
  _CircularOptionsState createState() => _CircularOptionsState();
}

class _CircularOptionsState extends State<CircularOptions> {
  @override
  Widget build(BuildContext context) {
    final settingArgs = Provider.of<Settings>(context);

    if (widget.asset == 'bottle')
      CircularOptions.sentBottle = true;
    else
      CircularOptions.sentBottle = false;

    if (settingArgs.isBottle)
      CircularOptions.selectedIcon = 'bottle';
    else
      CircularOptions.selectedIcon = 'glass';

    return GestureDetector(
      onTap: () {
        settingArgs.updateBottleSettings(CircularOptions.sentBottle);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CircularOptions.selectedIcon == widget.asset
              ? Colors.amber
              : Colors.white10,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        width: 60,
        height: 60,
        child: Image.asset('assets/icons/' + widget.asset + '.ico'),
      ),
    );
  }
}

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title),
    );
  }
}
