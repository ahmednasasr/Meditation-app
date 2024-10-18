import 'package:flutter/material.dart';

import 'night_island_details.dart';



class SleepScreenDetailes extends StatefulWidget {
  static const String routename = "SleepDetailes";
  const SleepScreenDetailes({super.key});

  @override
  State<SleepScreenDetailes> createState() => _SleepScreenDetailesState();
}

class _SleepScreenDetailesState extends State<SleepScreenDetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF03174C),
        body: Stack(children: [
          Container(
            child: Image(image: AssetImage("assets/images/Union.png")),
          ),
          Container(
            child: Image(image: AssetImage("assets/images/Group 6813.png")),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Sleep Stories",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Soothing bedtime stories to help you fall \n into a deep and natural sleep.",
              style: TextStyle(color: Color(0xffA0A3B1)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/q33.png"),
                    fit: BoxFit.cover,
                    width: 500,
                  ),
                  Positioned(
                      top: 60,
                      left: 90,
                      child: Center(
                          child: Text(
                        "The ocean moon",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xffFFE7BF)),
                      ))),
                  Positioned(
                    top: 100,
                    left: 90,
                    child: Center(
                        child: Text(
                      "Non-stop 8- hour mixes of our \n most popular sleep audio",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NightIslandDetails(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            child: Image(
                              image: AssetImage(
                                "assets/images/q11.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("Night Island",style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),),
                          Text("45 MIN SLEEP MUSIC",style: TextStyle(
                              fontSize: 10,
                              color: Colors.white
                          ),),
                        ],
                      )),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: () {

                      },
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            child: Image(
                              image: AssetImage(
                                "assets/images/q22.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("Sweet Sleep",style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                          ),),
                          Text("45 MIN SLEEP MUSIC",style: TextStyle(
                              fontSize: 10,
                              color: Colors.white
                          ),),
                        ],
                      )),
                ],
              ),
            ),
          ])
        ]));
  }
}
