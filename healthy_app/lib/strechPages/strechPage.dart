import 'package:healthy_app/strechPages/listOfStreches.dart';
import 'package:healthy_app/widgets/repeatedWidget.dart';
import 'package:flutter/material.dart';
import './strechDetailPage.dart';

class StrechPage extends StatelessWidget {
  final ListOfStreches _listOfStreches = new ListOfStreches();
  @override
  Widget build(BuildContext context) {
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
                  color: Colors.amber[400],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: GestureDetector(
                          child: Hero(
                            tag: _listOfStreches.getTag(index),
                            child: Image(
                              image: _listOfStreches.getImage(index),
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StrechDetailPage(
                                  index: index,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SmallTitleWidget(
                        title: _listOfStreches.getName(index),
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
