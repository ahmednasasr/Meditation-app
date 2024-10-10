import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  TimeOfDay selectedTime = TimeOfDay.now();
  List<bool> selectedDays = List.generate(7, (index) => false);

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    int hour = prefs.getInt('hour') ?? TimeOfDay.now().hour;
    int minute = prefs.getInt('minute') ?? TimeOfDay.now().minute;
    List<String> savedDays = prefs.getStringList('selectedDays') ??
        List.generate(7, (index) => 'false');

    selectedTime = TimeOfDay(hour: hour, minute: minute);
    selectedDays = savedDays.map((e) => e == 'true').toList();
    notifyListeners();
  }

  Future<void> savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('hour', selectedTime.hour);
    await prefs.setInt('minute', selectedTime.minute);
    await prefs.setStringList('selectedDays', selectedDays.map((e) => e.toString()).toList());
  }

}
