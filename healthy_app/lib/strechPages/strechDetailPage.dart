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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber[400],
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                    ),
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
                    color: Colors.white10,
                    height: 60.0,
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
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                color: Colors.amber[400],
                child: Text(
                  _listOfStreches.getName(index),
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      _listOfStreches.getDescription(index),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Container(
                      height: 400,
                      child: Text(
                        _listOfStreches.getInstruction(index),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
