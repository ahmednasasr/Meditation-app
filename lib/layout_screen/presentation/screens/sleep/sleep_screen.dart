import 'package:flutter/material.dart';
import 'package:meditation_app/layout_screen/presentation/screens/sleep/sleep_screen_detailes.dart';

class SleepScreen extends StatelessWidget {
  static const String routename="SleepScreen";
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF03174C),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(image: AssetImage("assets/images/543534.png"),fit: BoxFit.cover,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Wecome to Sleep",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              const SizedBox(height: 15),
              Text(
                'Explore the new king of sleep. It uses sound\nand vesualization to create perfect conditions \n for refreshing sleep..',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/454545.png',
                height: 250,
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SleepScreenDetailes()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff8E97FD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
