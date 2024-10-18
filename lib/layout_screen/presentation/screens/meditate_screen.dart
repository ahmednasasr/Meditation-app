import 'package:flutter/material.dart';
import 'package:meditation_app/layout_screen/presentation/widgets/custome_meditate_con.dart';

import '../widgets/custome_meditate.dart';

class MeditateScreen extends StatefulWidget {
  static const String routename = "Meditate";
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MeditateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Meditate",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Text(
              "we can learn how to recognize when our minds are doing their normal everyday acrobatics.",
              style: TextStyle(color: Color(0xffA0A3B1),fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTabController(
                length: 5,
                child: Expanded(
                  child: Column(
                    children: [
                      TabBar(
                          dividerColor: Colors.transparent,
                          unselectedLabelColor: Color(0xffA0A3B1),
                          labelColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          indicator: BoxDecoration(
                            color: Color(0xff8E97FD),
                            borderRadius: BorderRadius.circular(25),
                          ),

                          tabs: [
                            Tab(
                              child: Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    child: Center(
                                      child: Icon(Icons.all_inclusive),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(child: Text("All"))
                                ],
                              ),
                            ),
                            Tab(
                              child: Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    child: Center(
                                      child: Icon(Icons.favorite),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(child: Text("My"))
                                ],
                              ),
                            ),
                            Tab(
                              child: Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    child: Center(
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(child: Text("Anxious"))
                                ],
                              ),
                            ),
                            Tab(
                              child: Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    child: Center(
                                      child: Icon(Icons.nightlight_outlined),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(child: Text("Sleep"))
                                ],
                              ),
                            ),
                            Tab(
                              child: Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 30,
                                    child: Center(
                                      child: Icon(Icons.baby_changing_station),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(child: Text("Kids"))
                                ],
                              ),
                            ),


                          ]
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildAllTabContent(),
                            _buildMyTabContent(),
                            _buildAnxiousTabContent(),
                            _buildSleepTabContent(),
                            _buildKidsTabContent(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),



            ),


          ],
        ),
      ),
    );
  }

  Widget _buildAllTabContent() {
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          height: 100,
          width: 400,
          color: Color(0xffECD3C2),
          child: Stack(
            children: [
              Image(image: AssetImage("assets/images/324234234.png")),
              Positioned(
                  left: 200,
                  child: Image(image: AssetImage("assets/images/EEEEE.png"))),
              Center(child: Text("Daily Calm",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
              Positioned(
                  left: 310,
                  top: 30,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.play_circle),color: Colors.white,)),

            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: CustomeMeditate.cat.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: CustomeMeditateCon(customeMeditate: CustomeMeditate.cat[index])
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMyTabContent() {
    return ListView(
      children: [
        _buildMeditationCard("My Personal Session", "Customized for you"),
      ],
    );
  }

  Widget _buildAnxiousTabContent() {
    return ListView(
      children: [
        _buildMeditationCard("Calm Anxious Mind", ""),
        _buildMeditationCard("Overcome Anxiety", ""),
      ],
    );
  }

  Widget _buildSleepTabContent() {
    return ListView(
      children: [
        _buildMeditationCard("Sleep Stories", "Relax & sleep better"),
        _buildMeditationCard("Deep Sleep Meditation", ""),
      ],
    );
  }

  Widget _buildKidsTabContent() {
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
          height: 100,
          width: 400,
          color: Color(0xffECD3C2),
          child: Stack(
            children: [
              Image(image: AssetImage("assets/images/434434343.png")),
              Positioned(
                  left: 200,
                  child: Image(image: AssetImage("assets/images/EEEEE.png"))),
              Center(child: Text("Baby Calm",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
              Positioned(
                  left: 310,
                  top: 30,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.play_circle),color: Colors.white,)),

            ],
          ),
        ),
        SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Image(image: AssetImage("assets/images/baby.png")),
                  Positioned(
                      left: 200,
                      child: Image(image: AssetImage("assets/images/EEEEE.png"))),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  Expanded(child: Image(image: AssetImage("assets/images/baby2.png"))),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMeditationCard(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.play_arrow),
      ),
    );
  }
}
