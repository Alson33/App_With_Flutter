import 'package:healthy_app/recipePages/listOfRecipe.dart';
import 'package:healthy_app/recipePages/recipeDetailPage.dart';
import 'package:healthy_app/widgets/repeatedWidget.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final ListOfRecipe _listOfRecipes = new ListOfRecipe();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        children: <Widget>[
          TitleWidget(title: 'Recipes', color: Colors.white),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: MediaQuery.of(context).size.height - 550.0,
                  margin: EdgeInsets.all(20.0),
                  color: Colors.lightGreen[600],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: GestureDetector(
                          child: Hero(
                            tag: _listOfRecipes.getTag(index),
                            child: Image(
                              image: _listOfRecipes.getImage(index),
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeDetailPage(
                                  index: index,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SmallTitleWidget(
                        title: _listOfRecipes.getName(index),
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
