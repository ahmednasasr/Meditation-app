import 'package:flutter/material.dart';
import 'package:meditation_app/layout_screen/presentation/screens/happiness_details.dart';

class FocusDetails extends StatelessWidget {
  const FocusDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset('assets/images/Mask Group.png',fit: BoxFit.cover,),),
              SizedBox(height: 20),
              Text(
                "Focus Attention",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Ease your mind into a state of calm focus with this guided meditation.",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.favorite,color: Color(0xffFF84A2),),
                  Text("24.234 Favorits"),
                  Icon(Icons.music_note,color: Color(0xff7FD2F2),),
                  Text("34.234 Lestening"),
                ],
              ),
              SizedBox(height: 5,),
              Text("Pick a Nnrrator",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              TabBar(tabs: [
                Tab(text: "Male Voice",),
                Tab(text: "Female Voice",),
              ]),
              Expanded(
                child: TabBarView(children: [
                  buildVoiceList(),
                  buildVoiceList(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
