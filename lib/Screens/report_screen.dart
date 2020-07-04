import 'package:agri_flow/Screens/login_screen.dart';
import 'package:agri_flow/Screens/main_screen.dart';
import 'package:agri_flow/Screens/notification_screen.dart';
import 'package:agri_flow/Widgets/appbar.dart';
import 'package:agri_flow/Widgets/drawer.dart';
import 'package:agri_flow/Widgets/weather.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReportScreen extends StatefulWidget {
  final routeName = "ReportScreen";
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    _selectedIndex = index;
    Navigator.pushNamed(context, MainScreen().routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.sprout),
            title: Text('Plants'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.post),
            title: Text('Blog'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.chartAreaspline),
            title: Text('Report'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: DrawerNavigation(),
      body: Column(
        children: <Widget>[
          AppBarModified(),
          Weather(),
        ],
      ),
    );
  }
}
