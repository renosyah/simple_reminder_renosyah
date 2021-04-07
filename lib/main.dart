import 'package:simple_reminder_renosyah/routing/constanta.dart';
import 'package:simple_reminder_renosyah/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_reminder_renosyah/utils/theme.dart';
import 'package:simple_reminder_renosyah/routing/routes.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: kBackground));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Reminder',
        theme: theme(),
        initialRoute: splash,
        onGenerateRoute: route.Routes.generateRoute);
  }
}
