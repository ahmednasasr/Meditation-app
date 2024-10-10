import 'package:flutter/material.dart';
import 'package:meditation_app/layout_screen/presentation/manger/layout_provider.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatefulWidget {
  static const String routename="Layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(
      builder: (context, provider, child) {
        return  Scaffold(
            bottomNavigationBar:
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue,
                selectedLabelStyle: TextStyle(color: Colors.blue),
                unselectedItemColor: Colors.black,
                unselectedLabelStyle: TextStyle(color: Colors.black),
                onTap: (value){
                  provider.selectedIndex=value;
                  setState(() {
                  });
                },
                items: [
              BottomNavigationBarItem(icon: Image(image: AssetImage("assets/images/c.png")),label: "Home"),
              BottomNavigationBarItem(icon: Image(image: AssetImage("assets/images/l.png")),label: "Sleep"),
              BottomNavigationBarItem(icon: Image(image: AssetImage("assets/images/g.png")),label: "Meditate"),
              BottomNavigationBarItem(icon: Image(image: AssetImage("assets/images/d.png")),label: "Music"),
            ]),
          body: provider.screens[provider.selectedIndex],
        );
      },
    );
  }
}
