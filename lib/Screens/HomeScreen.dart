import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Screens/HelpScreen.dart';
import 'package:maxel/Screens/MusicScreen.dart';
import 'package:maxel/Screens/ProfileScreen.dart';
import 'package:maxel/Screens/ReportScreen.dart';
import 'package:maxel/Screens/SettingScreen.dart';
import 'package:maxel/Screens/TaskScreen.dart';
import 'package:maxel/snankBar.dart';
import 'package:maxel/them.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map> Screens = [
    {'page': const TaskScreen(), 'title': 'Tasks'},
    // {'page': const ReportScreen(), 'title': 'Report'},
    {'page': const MusicScreen(), 'title': 'Music'},
    {'page': const HelpScreen(), 'title': 'Help'},
    {'page': const ProfileScreen(), 'title': 'Profile'},
    {'page': const SettingScreen(), 'title': 'Setting'},
  ];
  var _statePage = 0;
  final AuthController _authController = Get.put(AuthController());
  var user = jsonDecode(jsonDecode(GetStorage().read('userData'))['data']);
  @override
  void initState() {
    super.initState();
    snakBarCheckInternet();
    _authController.getUserDate(user['idToken']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          Screens[_statePage]['title'],
          style: headerStylePage,
        ),
      ),
      body: Screens[_statePage]['page'],
      bottomNavigationBar: CurvedNavigationBar(
        index: _statePage,
        onTap: (value) {
          setState(() {
            _statePage = value;
          });
        },
        items: const [
          Icon(
            Icons.task,
            color: Colors.white,
          ),
          // Icon(
          //   Icons.report,
          //   color: Colors.white,
          // ),
          Icon(
            Icons.music_note,
            color: Colors.white,
          ),
          Icon(
            Icons.help,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
        color: Theme.of(context).primaryColor,
        backgroundColor: Get.isDarkMode
            ? const Color.fromARGB(255, 59, 59, 59)
            : Colors.white,
        height: 60,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
