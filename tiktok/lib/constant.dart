import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok/view/screens/add_video.dart';

const backgroundColor = Colors.white;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

var pageindex = [
  Text('Home'),
  Text('Search'),
  addVideoScreen(),
  Text('Messages'),
  Text("Profile")
];
