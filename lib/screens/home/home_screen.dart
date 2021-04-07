import 'package:simple_reminder_renosyah/screens/about/about_screen.dart';
import 'package:simple_reminder_renosyah/screens/home/components/body_home.dart';
import 'package:simple_reminder_renosyah/screens/reminder/reminder_screen.dart';
import 'package:simple_reminder_renosyah/utils/colors.dart';
import 'package:simple_reminder_renosyah/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _listPage;

  @override
  void initState() {
    super.initState();
    // inisialisasi kumpulan screen pada bottom navbar
    this._listPage = <Widget>[
      BodyHome(onTap: _onNavBarTap),
      ReminderScreen(),
      AboutScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    // inisialisasi ukuran smartphone dari class SizeConfig
    SizeConfig().init(context);

    // bottom navbar
    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Reminder"),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_rounded),
          label: "Help")
    ];

    return Scaffold(
      body: _listPage[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kWhite,
        elevation: 4,
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
        showSelectedLabels: false,
        selectedItemColor: kPrimary,
        unselectedItemColor: kIndicator,
        items: _bottomNavBarItems,
      ),
    );
  }
}
