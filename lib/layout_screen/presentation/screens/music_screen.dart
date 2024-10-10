import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  static const String routename="Music";
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
