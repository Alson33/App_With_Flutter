import 'package:healthy_app/widgets/repeatedWidget.dart';
import 'package:flutter/material.dart';
import './strechDetailPage.dart';
// import './listOfRecipe.dart';

// ListOfRecipe listOfRecipe;

class StrechPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _streches = [
      {
        'image': AssetImage('assets/images/exeIcon.jpg'),
        'tags': 'image 11',
        'steps': ['S1 one', 'S1 two', 'S1 three'],
      },
      {
        'image': AssetImage('assets/images/vegeIcon.jpg'),
        'tags': 'image 21',
        'steps': ['S2 one', 'S2 two', 'S2 three'],
      },
      {
        'image': AssetImage('assets/images/vegeIcon.jpg'),
        'tags': 'image 31',
        'steps': ['S3 one', 'S3 two', 'S3 three'],
      },
      {
        'image': AssetImage('assets/images/exeIcon.jpg'),
        'tags': 'image 41',
        'steps': ['S4 one', 'S4 two', 'S4 three'],
      },
      {
        'image': AssetImage('assets/images/exeIcon.jpg'),
        'tags': 'image 51',
        'steps': ['S5 one', 'S5 two', 'S5 three'],
      },
    ];

    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: Column(
          children: <Widget>[
            TitleWidget(title: 'Streches', color: Colors.white),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: MediaQuery.of(context).size.height - 400.0,
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            child: Hero(
                              // FIXME: Give appropriate tag and actual dish arts
                              tag: _streches[index]['tags'],
                              child: Image(
                                image: _streches[index]['image'],
                                fit: BoxFit.cover,
                              ),
                              // TODO: Make dish arts
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StrechDetailPage(
                                    image: _streches[index]['image'],
                                    tag: _streches[index]['tags'],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text('Strech'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
