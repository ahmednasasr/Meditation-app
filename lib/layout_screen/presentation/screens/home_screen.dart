import 'package:flutter/material.dart';
import 'package:meditation_app/layout_screen/presentation/widgets/custome_card.dart';
import 'package:meditation_app/layout_screen/presentation/widgets/custome_card2.dart';

import 'focus_details.dart';
import 'happiness_details.dart';

class HomeScreen extends StatefulWidget {
  static const String routename="Home screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body:  Column(
            children: [
              SizedBox(height: 60,),
              Text("Good Morning ,Afsar",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
              Text("we wish You Have a Good Day",style: TextStyle(fontSize: 15,color: Color(0xffA1A4B2)),),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: CustomeCard(image: "assets/images/ttttt.png", color: Color(0xff8E97FD), name: 'Basics')),
                  SizedBox(width: 10,),
                  Expanded(child: CustomeCard(image: "assets/images/hhhh.png", color: Color(0xffFFDB9D), name: 'Relaxation')),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                width: double.infinity,
                color: Color(0xff333242),
                child: Stack(
                  children: [
                    Image(image: AssetImage("assets/images/QQQ.png")),
                    Positioned(
                        left: 200,
                        child: Image(image: AssetImage("assets/images/EEEEE.png"))),
                    Center(child: Text("Daily Thought",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                    Positioned(
                        left: 310,
                        top: 30,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.play_circle),color: Colors.white,))
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text("Recommended For You ", style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                  InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FocusDetails()),
                        );
                      },
                      child: CustomeCard2("assets/images/Mask Group.png", "Foucs", "MEDITATION3-10 MIN")),
                  InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HappinessDetails()),
                        );
                      },
                      child: CustomeCard2("assets/images/Group 24.png", "Hppiness", "MEDITATION3-10 MIN")),
                  CustomeCard2("assets/images/Mask Group.png", "Foucs", "MEDITATION 3-10 MIN"),
                ],),
              )

            ],
          ),
        ),

    );
  }
}
