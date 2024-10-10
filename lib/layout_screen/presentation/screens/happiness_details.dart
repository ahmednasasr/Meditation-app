import 'package:flutter/material.dart';

class HappinessDetails extends StatelessWidget {
  const HappinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happiness'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset('assets/images/سسسسسس.png',fit: BoxFit.cover,),),            SizedBox(height: 20),
            Text(
              "Making Happiness",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Find joy in the little moments with this quick meditation session.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
