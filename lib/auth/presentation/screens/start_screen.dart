import 'package:flutter/material.dart';
import 'package:meditation_app/auth/presentation/screens/login_screen.dart';
import 'package:meditation_app/auth/presentation/screens/signup_screen.dart';

class StartScreen extends StatefulWidget {
  static const String routename = "Start";
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    height: 500,
                    width: 400,
                    child: Image(image: AssetImage("assets/images/Group.png"))),
              ],
            ),
            Text(
              "We are what we do",
              style: TextStyle(
                  color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              """
        Thousand of people are usign silent moon  
                          for smalls meditation 
            """,
              style: TextStyle(color: Color(0xffA1A4B2), fontSize: 15),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, SignupScreen.routename);
              },
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                    color: Color(0xff8E97FD),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
           Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ALREADY HAVE AN Account?",style: TextStyle(color: Color(0xffA1A4B2)),),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, LoginScreen.routename);
                  },
                    child:
                    Text("LogIn",style: TextStyle(color: Colors.blue),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
