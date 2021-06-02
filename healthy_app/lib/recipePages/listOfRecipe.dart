import 'package:flutter/material.dart';

class ListOfRecipe {
  List _recipes = [
    {
      'image': AssetImage('assets/images/recipies/salad.png'),
      'tags': 'salad-image',
      'name': 'Salad',
      'description':
          'Salad is the basic and most healthy vegan recipe out there. With freshly plucked vegitables we can easily create a salad anytime anywhere. Just wash some vegies and cut them to eatable pieces',
      'steps': ['S1 one', 'S1 two', 'S1 three'],
    },
    {
      'image': AssetImage('assets/images/recipies/omelette.png'),
      'tags': 'omelette-image',
      'name': 'Omlete',
      'description':
          'Filled With protien and lots of carbs egg is one of the major source of power for your body. Though boring old ways of boiling eggs might not be so interesting. Hence here is a healthy and yummy way of making eggs.',
      'steps': ['S2 one', 'S2 two', 'S2 three'],
    },
    {
      'image': AssetImage('assets/images/recipies/baked-potato.png'),
      'tags': 'bakedPotato-image',
      'name': 'Baked Potatos',
      'description':
          'Baked potatoes might not sound that appetitable but trust me they are the main source of all the carbohydrate your body needs. With freshly cleaned potates and made yummy with this recipe you wont have any complain.',
      'steps': ['S3 one', 'S3 two', 'S3 three'],
    },
    {
      'image': AssetImage('assets/images/recipies/overnight-oats.png'),
      'tags': 'overnightOats-image',
      'name': 'Over night Otas',
      'description':
          'Otas are simple, full of nutrients and yummy at the same time. With this receipe you can even make your best oats even great by preparing the oats over the night we can simply have a bowl of yummy and healthy breakfast ready to go inside our belly.',
      'steps': ['S4 one', 'S4 two', 'S4 three'],
    },
  ];

  Object getRecipe(int index) => _recipes[index];

  String getTag(int index) => _recipes[index]['tags'];

  AssetImage getImage(int index) => _recipes[index]['image'];

  String getName(int index) => _recipes[index]['name'];

  String getDescription(int index) => _recipes[index]['description'];
}
