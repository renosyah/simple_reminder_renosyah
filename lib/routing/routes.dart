import 'package:simple_reminder_renosyah/routing/constanta.dart';
import 'package:simple_reminder_renosyah/screens/about/about_screen.dart';
import 'package:simple_reminder_renosyah/screens/home/home_screen.dart';
import 'package:simple_reminder_renosyah/screens/reminder/create_reminder/create_reminder_screen.dart';
import 'package:simple_reminder_renosyah/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case about:
        return MaterialPageRoute(builder: (_) => AboutScreen());
      case createReminder:
        return MaterialPageRoute(builder: (_) => CreateReminderScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
