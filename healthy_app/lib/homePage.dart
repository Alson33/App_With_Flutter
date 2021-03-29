import 'package:healthy_app/services/SettingDb.dart';
import 'package:flutter/material.dart';
import 'services/Settings.dart';
import 'package:provider/provider.dart';

class HomePageMainPart extends StatefulWidget {
  HomePageMainPart({
    Key key,
  }) : super(key: key);

  @override
  _HomePageMainPartState createState() => _HomePageMainPartState();
}

class _HomePageMainPartState extends State<HomePageMainPart> {
  @override
  Widget build(BuildContext context) {
    final settingArgs = Provider.of<Settings>(context);
    return Expanded(
      flex: 5,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: FutureBuilder(
                future: SettingDB.settingDB.getSetting().then((value) {
                  Provider.of<Settings>(context).setSetting();
                }),
                builder: (context, snapshot) => Container(
                  alignment: Alignment.center,
                  child: settingArgs.noOfDrinks == 1
                      ? ImageIcon(
                          settingArgs.isBottle
                              ? AssetImage('assets/icons/bottle.ico')
                              : AssetImage('assets/icons/glass.ico'),
                          size: settingArgs.isBottle ? 350.0 : 400.0,
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: settingArgs.noOfDrinks,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Expanded(
                                child: ImageIcon(
                                  settingArgs.isBottle
                                      ? AssetImage('assets/icons/bottle.ico')
                                      : AssetImage('assets/icons/glass.ico'),
                                  size: settingArgs.isBottle ? 350.0 : 400.0,
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
  }
}

void _showSettingBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ChangeNotifierProvider<Settings>(
        create: (context) => Settings(),
        child: FutureBuilder(
          future: SettingDB.settingDB.getSetting().then((value) {
            Provider.of<Settings>(context).setSetting();
          }),
          builder: (context, snapshot) {
            return Container(
              color: Color(0x59000000),
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
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NoOfDrinksContainer(
                            title: '1',
                            isCorner: true,
                          ),
                          NoOfDrinksContainer(
                            title: '2',
                            isCorner: false,
                          ),
                          NoOfDrinksContainer(
                            title: '3',
                            isCorner: false,
                          ),
                          NoOfDrinksContainer(
                            title: '4',
                            isCorner: false,
                          ),
                          NoOfDrinksContainer(
                            title: '5',
                            isCorner: true,
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
                          TimeToRemindContainer(
                            title: '10min',
                            isCorner: true,
                          ),
                          TimeToRemindContainer(
                            title: '30min',
                            isCorner: false,
                          ),
                          TimeToRemindContainer(
                            title: '50min',
                            isCorner: false,
                          ),
                          TimeToRemindContainer(
                            title: '60min',
                            isCorner: false,
                          ),
                          TimeToRemindContainer(
                            title: '90min',
                            isCorner: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

class TimeToRemindContainer extends StatefulWidget {
  const TimeToRemindContainer({
    Key key,
    this.title,
    this.isCorner,
  }) : super(key: key);

  final String title;
  final bool isCorner;
  static int _time;

  @override
  _TimeToRemindContainerState createState() => _TimeToRemindContainerState();
}

class _TimeToRemindContainerState extends State<TimeToRemindContainer> {
  void getTime() {
    if (widget.title == "10min")
      TimeToRemindContainer._time = 10;
    else if (widget.title == "30min")
      TimeToRemindContainer._time = 30;
    else if (widget.title == "50min")
      TimeToRemindContainer._time = 50;
    else if (widget.title == "60min")
      TimeToRemindContainer._time = 60;
    else
      TimeToRemindContainer._time = 90;
  }

  @override
  Widget build(BuildContext context) {
    getTime();
    final settingArgs = Provider.of<Settings>(context);

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        color: settingArgs.time == TimeToRemindContainer._time
            ? Colors.amber
            : Colors.white,
        borderRadius: widget.isCorner
            ? BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )
            : BorderRadius.zero,
      ),
      child: GestureDetector(
        onTap: () {
          settingArgs.updateTimeSettings(TimeToRemindContainer._time);
        },
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}

class NoOfDrinksContainer extends StatefulWidget {
  const NoOfDrinksContainer({
    Key key,
    this.title,
    this.isCorner,
  }) : super(key: key);

  final String title;
  final bool isCorner;
  static int _noOfDrinks;

  @override
  _NoOfDrinksContainerState createState() => _NoOfDrinksContainerState();
}

class _NoOfDrinksContainerState extends State<NoOfDrinksContainer> {
  void getNoOfDrinks() {
    if (widget.title == "1")
      NoOfDrinksContainer._noOfDrinks = 1;
    else if (widget.title == "2")
      NoOfDrinksContainer._noOfDrinks = 2;
    else if (widget.title == "3")
      NoOfDrinksContainer._noOfDrinks = 3;
    else if (widget.title == "4")
      NoOfDrinksContainer._noOfDrinks = 4;
    else
      NoOfDrinksContainer._noOfDrinks = 5;
  }

  @override
  Widget build(BuildContext context) {
    getNoOfDrinks();
    final settingArgs = Provider.of<Settings>(context);
    return GestureDetector(
      onTap: () {
        settingArgs.updateNoOfDrinksSettings(NoOfDrinksContainer._noOfDrinks);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          color: settingArgs.noOfDrinks == NoOfDrinksContainer._noOfDrinks
              ? Colors.amber
              : Colors.white,
          borderRadius: widget.isCorner
              ? BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                )
              : BorderRadius.zero,
        ),
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}

class CircularOptions extends StatefulWidget {
  const CircularOptions({
    Key key,
    this.asset,
    this.sentBottle,
  }) : super(key: key);

  final String asset;

  final bool sentBottle;
  static String selectedIcon;

  @override
  _CircularOptionsState createState() => _CircularOptionsState();
}

class _CircularOptionsState extends State<CircularOptions> {
  @override
  Widget build(BuildContext context) {
    final settingArgs = Provider.of<Settings>(context);

    if (settingArgs.isBottle)
      CircularOptions.selectedIcon = 'bottle';
    else
      CircularOptions.selectedIcon = 'glass';

    return GestureDetector(
      onTap: () {
        settingArgs.updateBottleSettings(widget.sentBottle);
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
          child: Image.asset('assets/icons/' + widget.asset + '.ico'),
        ),
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
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}
