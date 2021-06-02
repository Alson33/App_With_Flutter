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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black54,
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
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _listOfRecipe.getName(index),
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      _listOfRecipe.getDescription(index),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
