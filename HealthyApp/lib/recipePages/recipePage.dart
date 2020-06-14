import 'package:HealthyApp/recipePages/recipeDetailPage.dart';
import 'package:HealthyApp/repeatedWidget.dart';
import 'package:flutter/material.dart';
import './listOfRecipe.dart';

ListOfRecipe listOfRecipe;

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // TODO: Make a custom paint for recipe page
          // CustomPaint(),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
          ),
          Column(
            children: <Widget>[
              BarWidget(isSettingPage: false),
              TitleWidget(title: 'Recipes', color: Colors.black),
              // TODO: Create a list view for the recipies
              // make hero animation avialable if possible
              Expanded(
                flex: 6,
                // TODO: Make the list builder work
                child: ListView.builder(
                  itemCount: listOfRecipe.length(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                child: Hero(
                                  // FIXME: Give appropriate tag and actual images
                                  tag: listOfRecipe.giveTag(index),
                                  child: Text(listOfRecipe.giveImage(index)),
                                  // TODO: Make dish arts
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeDetailPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: <Widget>[
                                  // FIXME: Make attractive
                                  Text('Name of the recipe.'),
                                  Text('Infos....'),
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text('Learn'),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
