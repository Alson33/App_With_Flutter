import 'package:healthy_app/widgets/repeatedWidget.dart';
import 'package:flutter/material.dart';
import './strechDetailPage.dart';
// import './listOfRecipe.dart';

// ListOfRecipe listOfRecipe;

class StrechPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List _streches = [
      {
        'image': AssetImage('assets/images/streches/ball-strech.png'),
        'tags': 'ball-strech-image',
        'name': 'Ball Strech',
        'steps': ['S1 one', 'S1 two', 'S1 three'],
      },
      {
        'image': AssetImage('assets/images/streches/cycling.png'),
        'tags': 'cycling-image',
        'name': 'Cycling',
        'steps': ['S2 one', 'S2 two', 'S2 three'],
      },
      {
        'image': AssetImage('assets/images/streches/sideStrech.png'),
        'tags': 'side-strech-image',
        'name': 'Side Strech',
        'steps': ['S3 one', 'S3 two', 'S3 three'],
      },
      {
        'image': AssetImage('assets/images/streches/sitUps.png'),
        'tags': 'sit-up-image',
        'name': 'Sit Ups',
        'steps': ['S4 one', 'S4 two', 'S4 three'],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        children: <Widget>[
          TitleWidget(title: 'Streches', color: Colors.white),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: MediaQuery.of(context).size.height - 550.0,
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: GestureDetector(
                          child: Hero(
                            tag: _streches[index]['tags'],
                            child: Image(
                              image: _streches[index]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StrechDetailPage(
                                  image: _streches[index]["image"],
                                  tag: _streches[index]["tags"],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SmallTitleWidget(
                        title: _streches[index]["name"],
                        color: Colors.black,
                        align: Alignment.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
