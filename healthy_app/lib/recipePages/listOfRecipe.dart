import 'package:flutter/material.dart';

class ListOfRecipe {
  List _recipes = [
    {
      'image': AssetImage('assets/images/recipies/salad.png'),
      'tags': 'salad-image',
      'nameTag': 'sal',
      'name': 'Salad',
      'description':
          'Salad is the basic and most healthy vegan recipe out there. With freshly plucked vegitables we can easily create a salad anytime anywhere. Just wash some vegies and cut them to eatable pieces',
      'steps': [
        'Step 1: Cut some freshly cleaned Vegetables(raw)',
        'Step 2: Add Some Fruits if you want to(optional)'
      ],
    },
    {
      'image': AssetImage('assets/images/recipies/omelette.png'),
      'tags': 'omelette-image',
      'nameTag': 'om',
      'name': 'Omlete',
      'description':
          'Filled With protien and lots of carbs egg is one of the major source of power for your body. Though boring old ways of boiling eggs might not be so interesting. Hence here is a healthy and yummy way of making eggs.',
      'steps': [
        'Step 1: Add some oil on pan low heat.',
        'Step 2: Crack Some eggs',
        'Step 3: Slowly pour the egg into the pan.',
        'Step 4: Put some salt(optional)',
        'Step 5: Raise the heat to medium and cook for a minute.',
        'Step 6: At some corrainders on top(optional)',
      ],
    },
    {
      'image': AssetImage('assets/images/recipies/baked-potato.png'),
      'tags': 'bakedPotato-image',
      'nameTag': 'bp',
      'name': 'Baked Potatos',
      'description':
          'Baked potatoes might not sound that appetitable but trust me they are the main source of all the carbohydrate your body needs. With freshly cleaned potates and made yummy with this recipe you wont have any complain.',
      'steps': [
        'Step 1: Get some potatos and poke all around with forks.',
        'Step 2: Heat the oven(or cooker)[450 F] in high heat.',
        'Step 3: Bake the potatoes for about 20 min.',
        'Step 4: Put some butter or oil in the potatoes.',
        'Step 5: Bake the potatoes for about 20 min again.',
        'Step 6: Slowly cut the potatoes put some salt and toppings. Ready to eat'
      ],
    },
    {
      'image': AssetImage('assets/images/recipies/overnight-oats.png'),
      'tags': 'overnightOats-image',
      'nameTag': 'ono',
      'name': 'Over night Otas',
      'description':
          'Otas are simple, full of nutrients and yummy at the same time. With this receipe you can even make your best oats even great by preparing the oats over the night we can simply have a bowl of yummy and healthy breakfast ready to go inside our belly.',
      'steps': [
        'Step 1: Take a jar pour your favorite kind of oats',
        'Step 2: Mix your oats with your favorite kind of milk (1/2 Cup).',
        'Step 3: Add friuts like strawberry, blueberry, raspberry small pieces.',
        'Step 4: It is a optional step but you can add Nut butter.',
        'Step 5: Finally put your yummy jar of oats in refrigerator.'
      ],
    },
  ];

  Object getRecipe(int index) => _recipes[index];

  String getTag(int index) => _recipes[index]['tags'];

  String getNameTag(int index) => _recipes[index]['nameTag'];

  AssetImage getImage(int index) => _recipes[index]['image'];

  String getName(int index) => _recipes[index]['name'];

  String getDescription(int index) => _recipes[index]['description'];

  List getSteps(int index) => _recipes[index]['steps'];

  int getStepCount(int index) => _recipes[index]['steps'].length;
}
