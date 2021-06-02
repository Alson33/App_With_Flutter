import 'package:flutter/material.dart';

class ListOfStreches {
  List _streches = [
    {
      'image': AssetImage('assets/images/streches/ball-strech.png'),
      'tags': 'ball-strech-image',
      'name': 'Ball Strech',
      'description': '',
      'steps': ['S1 one', 'S1 two', 'S1 three'],
    },
    {
      'image': AssetImage('assets/images/streches/cycling.png'),
      'tags': 'cycling-image',
      'name': 'Cycling',
      'description': '',
      'steps': ['S2 one', 'S2 two', 'S2 three'],
    },
    {
      'image': AssetImage('assets/images/streches/sideStrech.png'),
      'tags': 'side-strech-image',
      'name': 'Side Strech',
      'description': '',
      'steps': ['S3 one', 'S3 two', 'S3 three'],
    },
    {
      'image': AssetImage('assets/images/streches/sitUps.png'),
      'tags': 'sit-up-image',
      'name': 'Sit Ups',
      'description': '',
      'steps': ['S4 one', 'S4 two', 'S4 three'],
    },
  ];

  Object getStrech(int index) => _streches[index];

  String getTag(int index) => _streches[index]['tags'];

  AssetImage getImage(int index) => _streches[index]['image'];

  String getName(int index) => _streches[index]['name'];

  String getDescription(int index) => _streches[index]['description'];
}
