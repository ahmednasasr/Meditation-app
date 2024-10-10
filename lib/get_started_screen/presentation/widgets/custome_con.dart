import 'dart:ui';

import 'package:flutter/material.dart';

class CustomeCat{
  String title;
  String pathImg;
  Color color;
  double width;
  double height;

   CustomeCat(this.title, this.pathImg,this.color, this.width, this.height);

  static List<CustomeCat> cat=[
    CustomeCat( "Reduce Stress", "assets/images/Group 6786.png", Color(0xff808AFF), 170, 210),
    CustomeCat( "improve preformance", "assets/images/1.png", Color(0xffF05D48), 170, 167),
    CustomeCat( "increase happinse", "assets/images/Group (1).png", Color(0xffF4A17C), 170, 210),
    CustomeCat( "Reduce anxiety", "assets/images/3.png", Color(0xffFFCF86), 170, 167),
    CustomeCat( "persnol growth", "assets/images/4.png", Color(0xff76C79E), 170, 210),
    CustomeCat( "better sleep", "assets/images/5.png", Color(0xff4E5567), 170, 167),

  ];
}