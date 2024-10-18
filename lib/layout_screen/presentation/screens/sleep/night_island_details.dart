import 'package:flutter/material.dart';

class NightIslandDetails extends StatelessWidget {
  const NightIslandDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF03174C),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/images/q11.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Night Island",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Ease the mind into a restful night’s sleep  with \n these deep, amblent tones..",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.favorite,color: Color(0xffFF84A2),),
                Text("24.234 Favorits",style: TextStyle(color: Colors.white),),
                Icon(Icons.music_note,color: Color(0xff7FD2F2),),
                Text("34.234 Lestening",style: TextStyle(color: Colors.white),),
              ],
            ),
            SizedBox(height: 20),
            Text("Related",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
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
                                "assets/images/ege.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("Moon Clouds",style: TextStyle(
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
            Spacer(),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFFE7BF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: Text(
                  "Play",
                  style: TextStyle(color: Color(0xFF03174C), fontSize: 18),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
