import 'package:HealthyApp/customPaints/colors.dart';
import 'package:HealthyApp/strechPages/strechPage.dart';
import 'package:flutter/material.dart';
import 'package:HealthyApp/recipePages/recipePage.dart';

class EatHealthyWidget extends StatelessWidget {
  const EatHealthyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Row(
          children: <Widget>[
            IconPart(
              assetImage: AssetImage('assets/icons/vegeIcon.ico'),
              route: RecipePage(),
            ),
            DescriptionPart(
              title: 'Eat Healthy',
              descp:
                  'Eat Healthy food for a balanced diet, by the help of these yummy yet healthy recipes you can learn to make some healthy foods',
              // buttonTitle: 'Learn',
            ),
          ],
        ),
      ),
    );
  }
}

class BeHealthyWidget extends StatelessWidget {
  const BeHealthyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Row(
          children: <Widget>[
            DescriptionPart(
              title: 'Be Healthy',
              descp:
                  'Have a well managed and healthy body with some of the streching programs which are easy to do , any time any where',
              // buttonTitle: 'Strech',
            ),
            // TODO: create a strech icon
            IconPart(
              assetImage: AssetImage('assets/icons/exeIcon.ico'),
              route: StrechPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class IconPart extends StatelessWidget {
  const IconPart({
    Key key,
    @required this.assetImage,
    @required this.route,
  }) : super(key: key);

  final AssetImage assetImage;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          child: Center(
            child: ImageIcon(
              assetImage,
              color: Colors.white,
              size: 200.0,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => route,
              ),
            );
          },
        ),
      ),
    );
  }
}

// FIXME: Fix the description part and move it to repeated widget file
class DescriptionPart extends StatelessWidget {
  const DescriptionPart({
    Key key,
    @required this.title,
    @required this.descp,
    this.buttonTitle,
  }) : super(key: key);

  final String title;
  final String buttonTitle;
  final String descp;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: Colors.green[200],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                descp,
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            buttonTitle != null
                ? Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: RaisedButton(
                          color: colorForButton,
                          onPressed: () {},
                          child: Text(buttonTitle),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
