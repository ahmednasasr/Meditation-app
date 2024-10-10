import 'package:flutter/material.dart';
import 'package:meditation_app/layout_screen/presentation/screens/meditate_screen.dart';
import 'package:meditation_app/layout_screen/presentation/screens/music_screen.dart';
import 'package:meditation_app/layout_screen/presentation/screens/sleep_screen.dart';

import '../screens/home_screen.dart';

class LayoutProvider extends ChangeNotifier{
  int selectedIndex=0;
  List<Widget> screens =[
    HomeScreen(),
    SleepScreen(),
    MeditateScreen(),
    MusicScreen(),
  ];
}