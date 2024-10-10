import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/layout_screen/presentation/screens/layout_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../manger/home_provider.dart';

class ReminderScreen extends StatefulWidget {
  static const String routename = "Reminder";

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var provider = Provider.of<HomeProvider>(context, listen: false);
      provider.loadPreferences();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20),
            Text(
              "What time would you like to meditate?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
                "Any time you can choose but we recommend first thing in the morning."),
            SizedBox(
              height: 100,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime(0, 0, 0, provider.selectedTime.hour,
                    provider.selectedTime.minute),
                onDateTimeChanged: (DateTime newTime) {
                  setState(() {
                    provider.selectedTime =
                        TimeOfDay(hour: newTime.hour, minute: newTime.minute);
                  });
                },
              ),
            ),
            SizedBox(height: 20),
           const Text(
              "Which day would you like to meditate?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("Everyday is best, but we recommend picking at least five."),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return ChoiceChip(
                  label: Text(
                    ["SU", "M", "T", "W", "TH", "F", "S"][index],
                  ),
                  selected: provider.selectedDays[index],
                  onSelected: (bool selected) {
                    setState(() {
                      provider.selectedDays[index] = selected;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{
                await provider.savePreferences();
                Navigator.pushNamed(context, LayoutScreen.routename);
              },
              child: Text("SAVE"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("NO THANKS"),
            ),
          ],
        ),
      ),
    );
  }
}
