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
                selectedLabelStyle: TextStyle(color: Colors.blue, fontSize: 12),
                unselectedItemColor: Colors.black,
                unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 12),
                currentIndex: provider.selectedIndex,
                onTap: (value){
                  provider.updateIndex(value);
                },
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image.asset("assets/images/c.png"),
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image.asset("assets/images/l.png"),
                      ),
                      label: "Sleep",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image.asset("assets/images/g.png"),
                      ),
                      label: "Meditate",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image.asset("assets/images/d.png"),
                      ),
                      label: "Music",
                    ),
            ]),
          body: provider.screens[provider.selectedIndex],
        );
      },
    );
  }
}
