class ListOfRecipe {
  List _recipes = [
    {
      'image': 'fisrt image',
      'tags': 'image 1',
      'steps': ['S1 one', 'S1 two', 'S1 three'],
    },
    {
      'image': 'second image',
      'tags': 'image 2',
      'steps': ['S2 one', 'S2 two', 'S2 three'],
    },
    {
      'image': 'third image',
      'tags': 'image 3',
      'steps': ['S3 one', 'S3 two', 'S3 three'],
    },
    {
      'image': 'fourth image',
      'tags': 'image 4',
      'steps': ['S4 one', 'S4 two', 'S4 three'],
    },
    {
      'image': 'fifth image',
      'tags': 'image 5',
      'steps': ['S5 one', 'S5 two', 'S5 three'],
    },
  ];

  String giveImage(int index) {
    return _recipes[index]['image'];
  }

  String giveTag(int index) {
    return _recipes[index]['tags'];
  }

  length(){
    return _recipes.length;
  }

}
