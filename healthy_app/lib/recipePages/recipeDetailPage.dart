import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:healthy_app/recipePages/listOfRecipe.dart';

class RecipeDetailPage extends StatelessWidget {
  RecipeDetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  final ListOfRecipe _listOfRecipe = new ListOfRecipe();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
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
                    // color: Colors.lightGreen[600],
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[600],
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    height: 300,
                    child: Hero(
                      tag: _listOfRecipe.getTag(index),
                      child: Image(
                        image: _listOfRecipe.getImage(index),
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
                color: Colors.lightGreen[600],
                child: Text(
                  _listOfRecipe.getName(index),
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
                      _listOfRecipe.getDescription(index),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Steps to cook',
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Container(
                      height: 400,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _listOfRecipe.getStepCount(index),
                          itemBuilder: (context, ind) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                // horizontal: 12.0,
                              ),
                              child: Text(_listOfRecipe.getSteps(index)[ind]),
                            );
                          }),
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
