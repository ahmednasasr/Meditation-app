import 'package:flutter/material.dart';

class MeditateScreen extends StatefulWidget {
  static const String routename="Meditate";
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MeditateScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
