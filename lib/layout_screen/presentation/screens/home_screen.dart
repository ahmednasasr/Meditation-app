import 'package:flutter/material.dart';
import 'package:meditation_app/auth/presentation/screens/login_screen.dart';
import 'package:meditation_app/layout_screen/presentation/widgets/custome_card.dart';
import 'package:meditation_app/layout_screen/presentation/widgets/custome_card2.dart';

import 'focus_details.dart';
import 'happiness_details.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "Home screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showRocket = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startRocketLaunch(Widget nextPage) {
    setState(() {
      showRocket = true;
    });

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );

        setState(() {
          showRocket = false;
        });
        _controller.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 60),
                Text(
                  "Good Morning ,Afsar",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "we wish You Have a Good Day",
                  style: TextStyle(fontSize: 15, color: Color(0xffA1A4B2)),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: CustomeCard(
                      image: "assets/images/ttttt.png",
                      color: Color(0xff8E97FD),
                      name: 'Basics',
                      onPressed: () {
                        startRocketLaunch(FocusDetails());
                      },
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: CustomeCard(
                      image: "assets/images/hhhh.png",
                      color: Color(0xffFFDB9D),
                      name: 'Relaxation',
                      onPressed: () {
                        startRocketLaunch(
                            HappinessDetails()); // تحريك الصاروخ والانتقال إلى FocusDetails
                      },
                    )),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Color(0xff333242),
                  child: Stack(
                    children: [
                      Image(image: AssetImage("assets/images/QQQ.png")),
                      Positioned(
                          left: 200,
                          child: Image(
                              image: AssetImage("assets/images/EEEEE.png"))),
                      Center(
                        child: Text(
                          "Daily Thought",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        left: 290,
                        top: 30,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.play_circle),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Recommended For You ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FocusDetails()),
                          );
                        },
                        child: CustomeCard2("assets/images/Mask Group.png",
                            "Foucs", "MEDITATION3-10 MIN"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HappinessDetails()),
                          );
                        },
                        child: CustomeCard2("assets/images/Group 24.png",
                            "Hppiness", "MEDITATION3-10 MIN"),
                      ),
                      CustomeCard2("assets/images/Mask Group.png", "Foucs",
                          "MEDITATION 3-10 MIN"),
                    ],
                  ),
                ),
              ],
            ),
            if (showRocket) _buildRocketAnimation(),
          ],
        ),
      ),
    );
  }

  // دالة لعرض الصاروخ المتحرك
  Widget _buildRocketAnimation() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Positioned(
          bottom: MediaQuery.of(context).size.height * _animation.value,
          left: MediaQuery.of(context).size.width * 0.4,
          child: Image.asset(
            'assets/images/rocket.png',
            width: 100,
            height: 100,
          ),
        );
      },
    );
  }
}
