import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_reminder_renosyah/models/reminder.dart';

class Reminders {

  List<Reminder> reminders = List<Reminder>();

  Reminders();

  Reminders.fromJson(Map<String, dynamic> json) {
    if (json['reminders'] != null) {
      reminders = new List<Reminder>();
      json['reminders'].forEach((v) {
        reminders.add(new Reminder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reminders != null) {
      data['reminders'] = this.reminders.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<Reminders> append(Reminder reminder) async {
    var reminders = await this.load();
    if (reminders == null){
      reminders = new Reminders();
      reminders.reminders.add(reminder);
      var save = await this.save(reminders);
      return save;
    }
    reminders.reminders.add(reminder);
    var save = await this.save(reminders);
    return save;
  }

  Future<Reminders> save(Reminders reminders) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("reminder_data", jsonEncode(reminders.toJson()));
    return this;
  }

  Future<Reminders> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session = prefs.getString("reminder_data");
    if (session == null || session.isEmpty) {
      return null;
    }
    return Reminders.fromJson(jsonDecode(session));
  }
}