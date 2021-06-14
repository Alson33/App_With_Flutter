import 'package:flutter/material.dart';

class ListOfStreches {
  List _streches = [
    {
      'image': AssetImage('assets/images/streches/ball-strech.png'),
      'tags': 'ball-strech-image',
      'name': 'Ball Strech',
      'description':
          "It is one of the best way of streching your whole body at the same time. Don't worry if you don't have acess to strech balls you can pile up some pillows or any soft materials to mimick the ball and do the strech. Just make sure you do each reps cearfully as you might hurt your self.",
      'instructions': '3reps of 5-10min',
    },
    {
      'image': AssetImage('assets/images/streches/cycling.png'),
      'tags': 'cycling-image',
      'name': 'Cycling',
      'description':
          'Without a doubt outdoor activies are natural way of streching and refreshing your mind all together at the same time. Cycling is one of the best option to try out as it not only streches your body but also exercises your body with all the peedling and makes you healthy with all the sweat wastage leaving your body.',
      'instructions': '20-50min',
    },
    {
      'image': AssetImage('assets/images/streches/sideStrech.png'),
      'tags': 'side-strech-image',
      'name': 'Side Strech',
      'description':
          'It is a simple strech practice, that is easy to do and works out your inactive muscles from lower arm areas. If you extend your legs then this exercise will also help you activate your thigh muscles. Just dont try to strech too hard you might get muscle cramps.',
      'instructions': '3reps of 12 each sides',
    },
    {
      'image': AssetImage('assets/images/streches/sitUps.png'),
      'tags': 'sit-up-image',
      'name': 'Sit Ups',
      'description':
          'They go really one on one with the core abdomine muscles and butt muscles. With each reps of situps you can feel the tension growing in your core, which is a good sign.',
      'instructions': '3reps of 10 slowly increasing to 20',
    },
  ];

  Object getStrech(int index) => _streches[index];

  String getTag(int index) => _streches[index]['tags'];

  AssetImage getImage(int index) => _streches[index]['image'];

  String getName(int index) => _streches[index]['name'];

  String getDescription(int index) => _streches[index]['description'];

  String getInstruction(int index) => _streches[index]['instructions'];
}
