import 'package:flutter/material.dart';
import 'package:healthy_app/strechPages/listOfStreches.dart';

class StrechDetailPage extends StatelessWidget {
  StrechDetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final ListOfStreches _listOfStreches = new ListOfStreches();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: Hero(
                      tag: _listOfStreches.getTag(index),
                      child: Image(
                        image: _listOfStreches.getImage(index),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    color: Colors.white10,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
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
