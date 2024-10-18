import 'dart:ui';

import 'package:flutter/material.dart';

class CustomeMeditate{
  String title;
  String pathImg;
  Color color;
  double width;
  double height;

  CustomeMeditate(this.title, this.pathImg,this.color, this.width, this.height);

  static List<CustomeMeditate> cat=[
    CustomeMeditate( "7 Days of Calm", "assets/images/z1.png", Color(0xff808AFF), 170, 210),
    CustomeMeditate( "Anxiet Release", "assets/images/z2.png", Color(0xffF05D48), 170, 210),
    CustomeMeditate( "relax", "assets/images/z3.png", Color(0xffF4A17C), 170, 210),
    CustomeMeditate( "growth", "assets/images/z4.png", Color(0xff76C79E), 170, 210),

  ];
}