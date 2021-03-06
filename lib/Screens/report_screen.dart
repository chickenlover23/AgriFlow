import 'dart:io';

import 'package:agri_flow/Screens/plants_screen.dart';
import 'package:agri_flow/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'blog_screen.dart';
import 'notification_screen.dart';

class ReportScreen extends StatefulWidget {
  final routeName = "ReportScreen";
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
/*   Future<File> getFile(String fileName) async {
    final appDir = await getTemporaryDirectory();
    final appPath = appDir.path;
    final fileOnDevice = File('$appPath/$fileName');
    final rawAssetFile = await rootBundle.load(fileName);
    final rawBytes = rawAssetFile.buffer.asUint8List();
    await fileOnDevice.writeAsBytes(rawBytes, flush: true);
    return fileOnDevice;
  } */

  /* Future<File> getFile(String fileName) async {
    final appDir = await getTemporaryDirectory();
    final appPath = appDir.path;
    final fileOnDevice = File('$appPath/$fileName');
    final rawAssetFile = await rootBundle.load(fileName);
    final rawBytes = rawAssetFile.buffer.asUint8List();
    await fileOnDevice.writeAsBytes(rawBytes, flush: true);
    return fileOnDevice;
  } */

  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        Navigator.pushNamed(context, PlantsScreen().routeName);
      } else if (index == 1) {
        Navigator.pushNamed(context, BlogSCreen().routeName);
      } else {
        Navigator.pushNamed(context, ReportScreen().routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationScreen().routeName);
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: DrawerNavigation(),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Report",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image(
                image: AssetImage("Assets/Images/g1.png"),
                width: 300,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image(
                image: AssetImage("Assets/Images/g2.png"),
                width: 300,
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
      ),
    );
  }
}
