import 'package:flutter/material.dart';
import 'services/Settings.dart';
import 'package:provider/provider.dart';

class HomePageMainPart extends StatefulWidget {
  HomePageMainPart({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageMainPartState createState() => _HomePageMainPartState();
}

class _HomePageMainPartState extends State<HomePageMainPart> {
  @override
  Widget build(BuildContext context) {
    final settingArgs = Provider.of<Settings>(
      context,
      listen: false,
    );

    return Expanded(
      flex: 5,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: settingArgs.noOfDrinks == 1 ||
                      settingArgs.noOfDrinks == null
                  ? ImageIcon(
                      settingArgs.isBottle == null ||
                              settingArgs.isBottle == true
                          ? AssetImage('assets/icons/bottle.ico')
                          : AssetImage('assets/icons/glass.ico'),
                      size: settingArgs.isBottle == null ||
                              settingArgs.isBottle == true
                          ? 350.0
                          : 400.0,
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: settingArgs.noOfDrinks,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Expanded(
                            child: ImageIcon(
                              settingArgs.isBottle == null ||
                                      settingArgs.isBottle == true
                                  ? AssetImage('assets/icons/bottle.ico')
                                  : AssetImage('assets/icons/glass.ico'),
                              size: settingArgs.isBottle == null ||
                                      settingArgs.isBottle == true
                                  ? 350.0
                                  : 400.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              color: Colors.yellowAccent,
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
                    color: Colors.grey[100]!.withOpacity(0.2),
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
  }
}

void _showSettingBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Consumer<Settings>(
        builder: (context, value, child) => Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomSheetTitle(
                  title: 'Choose a medium:',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularOptions(
                      asset: 'bottle',
                      sentBottle: true,
                    ),
                    CircularOptions(
                      asset: 'glass',
                      sentBottle: false,
                    ),
                  ],
                ),
                BottomSheetTitle(
                  title: 'No of bottles:',
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: NoOfDrinks(),
                ),
                BottomSheetTitle(
                  title: 'Remind me in:',
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: TimeToRemind(),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class TimeToRemind extends StatelessWidget {
  final int _maxTimeCount = 5;

  @override
  Widget build(BuildContext context) {
    final settingArgs = Provider.of<Settings>(
      context,
      listen: false,
    );

    return ListView.builder(
      itemCount: _maxTimeCount,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, n) {
        n = n * 10 + 20;
        return GestureDetector(
          onTap: () {
            settingArgs.updateTimeSettings(n);
          },
          child: Container(
            width: 50,
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              color: settingArgs.time == n ? Colors.amber : Colors.white,
            ),
            child: Center(
              child: Text('$n min'),
            ),
          ),
        );
      },
    );
  }
}

class NoOfDrinks extends StatelessWidget {
  final int _maxCount = 5;

  @override
  Widget build(BuildContext context) {
    final settingArgs = Provider.of<Settings>(
      context,
      listen: false,
    );

    return ListView.builder(
      itemCount: _maxCount,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, n) {
        n++;
        return GestureDetector(
          onTap: () {
            settingArgs.updateNoOfDrinksSettings(n);
          },
          child: Container(
            width: 50,
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              color: settingArgs.noOfDrinks == n ? Colors.amber : Colors.white,
            ),
            child: Center(
              child: Text('$n'),
            ),
          ),
        );
      },
    );
  }
}

class CircularOptions extends StatefulWidget {
  const CircularOptions({
    Key? key,
    this.asset,
    this.sentBottle,
  }) : super(key: key);

  final String? asset;

  final bool? sentBottle;
  static String? selectedIcon;

  @override
  _CircularOptionsState createState() => _CircularOptionsState();
}

class _CircularOptionsState extends State<CircularOptions> {
  @override
  Widget build(BuildContext context) {
    final settingArgs = Provider.of<Settings>(
      context,
      listen: false,
    );
    print(settingArgs.isBottle);

    if (settingArgs.isBottle == null || settingArgs.isBottle == true)
      CircularOptions.selectedIcon = 'bottle';
    else
      CircularOptions.selectedIcon = 'glass';

    return GestureDetector(
      onTap: () {
        settingArgs.updateBottleSettings(widget.sentBottle!);
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
        child: Center(
          child: Image.asset('assets/icons/' + widget.asset! + '.ico'),
        ),
      ),
    );
  }
}

class BottomSheetTitle extends StatelessWidget {
  BottomSheetTitle({
    Key? key,
    String? title,
  })  : title = title,
        super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title!,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}
