import 'package:flutter/material.dart';

class HappinessDetails extends StatelessWidget {
  const HappinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/سسسسسس.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
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
              TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Male Voice"),
                  Tab(text: "Female Voice"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    buildVoiceList(),
                    buildVoiceList(),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

Widget buildVoiceList() {
  return ListView(
    children: [
      ListTile(
        leading: Icon(Icons.play_circle_fill, color: Colors.blue),
        title: Text("Focus Attention"),
        subtitle: Text("10 MIN"),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // Handle play audio action
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.play_circle_fill, color: Colors.blue),
        title: Text("Body Scan"),
        subtitle: Text("5 MIN"),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // Handle play audio action
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.play_circle_fill, color: Colors.blue),
        title: Text("Making Happiness"),
        subtitle: Text("3 MIN"),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          // Handle play audio action
        },
      ),
    ],
  );
}
