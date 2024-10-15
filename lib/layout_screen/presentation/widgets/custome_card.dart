import 'package:flutter/material.dart';

class CustomeCard extends StatelessWidget {
  final String image;
  final Color color;
  final String name;
  final VoidCallback onPressed;

  CustomeCard({
    super.key,
    required this.image,
    required this.color,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 100,
            child: Image(image: AssetImage(image)),
          ),
          Positioned(
            left: 10,
            top: 20,
            child: Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 120,
            left: 80,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text("Start"),
            ),
          ),
        ],
      ),
    );
  }
}
