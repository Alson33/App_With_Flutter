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
        'image': AssetImage('assets/images/vegeIcon.jpg'),
        'tags': 'image 1',
        'steps': ['S1 one', 'S1 two', 'S1 three'],
      },
      {
        'image': AssetImage('assets/images/exeIcon.jpg'),
        'tags': 'image 2',
        'steps': ['S2 one', 'S2 two', 'S2 three'],
      },
      {
        'image': AssetImage('assets/images/vegeIcon.jpg'),
        'tags': 'image 3',
        'steps': ['S3 one', 'S3 two', 'S3 three'],
      },
      {
        'image': AssetImage('assets/images/exeIcon.jpg'),
        'tags': 'image 4',
        'steps': ['S4 one', 'S4 two', 'S4 three'],
      },
      {
        'image': AssetImage('assets/images/vegeIcon.jpg'),
        'tags': 'image 5',
        'steps': ['S5 one', 'S5 two', 'S5 three'],
      },
    ];

    // List<String> _images = listOfRecipe.giveImage();

    return Scaffold(
      body: Container(
        color: Colors.lightGreen,
        child: Column(
          children: <Widget>[
            TitleWidget(title: 'Recipes', color: Colors.white),
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
                          flex: 3,
                          child: GestureDetector(
                            child: Hero(
                              // FIXME: Give appropriate tag and actual dish arts
                              tag: _recipes[index]['tags']!,
                              child: Image(
                                image: _recipes[index]["image"],
                                fit: BoxFit.cover,
                              ),
                              // TODO: Make dish arts
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
                        Expanded(
                          flex: 1,
                          child: SmallTitleWidget(
                            title: 'Name',
                            color: Colors.black,
                            align: Alignment.center,
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
