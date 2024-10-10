import 'package:flutter/material.dart';
import 'package:meditation_app/get_started_screen/presentation/screen/reminder_screen.dart';

import '../widgets/category_widget.dart';
import '../widgets/custome_con.dart';

class TopicsScreen extends StatefulWidget {
  static const String routename = "Home";
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  List<bool> selectedTopics = [];

  @override
  void initState() {
    super.initState();
    selectedTopics = [
      false,
      false,
      false,
      false,
      false,
      false,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              """What Brings you
             "to Silent Moon?""",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "choose a topic to focuse on:",
              style: TextStyle(color: Color(0xffA1A4B2), fontSize: 15),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: CustomeCat.cat.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTopics[index] = !selectedTopics[index];
                      });
                    },
                    child: CategoryWidget(
                      customeCon: CustomeCat.cat[index],
                      isSelected: selectedTopics[index],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReminderScreen()),
                );
              },
              child: const Text("Next =>"),
            ),
          ],
        ),
      ),
    );
  }
}
