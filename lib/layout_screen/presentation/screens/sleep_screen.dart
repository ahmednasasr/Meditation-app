import 'package:flutter/material.dart';

class SleepScreen extends StatefulWidget {
  static const String routename="Sleep";
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SleepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
      ),
    );
  }
}
