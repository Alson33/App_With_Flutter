import 'package:healthy_app/recipePages/recipeDetailPage.dart';
import 'package:healthy_app/widgets/repeatedWidget.dart';
import 'package:flutter/material.dart';
// import './listOfRecipe.dart';

// ListOfRecipe listOfRecipe;

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List _recipes = [
      {
        'image': AssetImage('assets/images/recipies/salad.png'),
        'tags': 'salad-image',
        'name': 'Salad',
        'steps': ['S1 one', 'S1 two', 'S1 three'],
      },
      {
        'image': AssetImage('assets/images/recipies/omelette.png'),
        'tags': 'omelette-image',
        'name': 'Omlete',
        'steps': ['S2 one', 'S2 two', 'S2 three'],
      },
      {
        'image': AssetImage('assets/images/recipies/baked-potato.png'),
        'tags': 'bakedPotato-image',
        'name': 'Baked Potatos',
        'steps': ['S3 one', 'S3 two', 'S3 three'],
      },
      {
        'image': AssetImage('assets/images/recipies/overnight-oats.png'),
        'tags': 'overnightOats-image',
        'name': 'Over night Otas',
        'steps': ['S4 one', 'S4 two', 'S4 three'],
      },
    ];

    // List<String> _images = listOfRecipe.giveImage();

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: GestureDetector(
                          child: Hero(
                            tag: _recipes[index]['tags']!,
                            child: Image(
                              image: _recipes[index]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeDetailPage(
                                  image: _recipes[index]["image"],
                                  tag: _recipes[index]["tags"],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SmallTitleWidget(
                        title: _recipes[index]["name"],
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
