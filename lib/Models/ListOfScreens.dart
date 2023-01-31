import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Screens/HelpScreen.dart';
import 'package:maxel/Screens/MusicScreen.dart';
import 'package:maxel/Screens/ProfileScreen.dart';
import 'package:maxel/Screens/TaskScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<Widget> buildScreens() {
  return [
    const TaskScreen(),
    const MusicScreen(),
    const HelpScreen(),
    const ProfileScreen(),
  ];
}

final List titles = [
  'Tasks',
  'Music',
  'Help',
  'Profile',
];

List<PersistentBottomNavBarItem> navBarsItems(context) {
  return [
    PersistentBottomNavBarItem(
      // textStyle: const TextStyle(color: Colors.white),
      icon: const Icon(Icons.task),
      title: ("Task"),
      activeColorPrimary:
          Get.isDarkMode ? Colors.white : Theme.of(context).accentColor,
      inactiveColorPrimary: Get.isDarkMode ? Colors.white : Colors.black,
    ),
    PersistentBottomNavBarItem(
      // // textStyle: const TextStyle(color: Colors.white),
      icon: const Icon(Icons.music_note),
      title: ("Music"),
      activeColorPrimary:
          Get.isDarkMode ? Colors.white : Theme.of(context).accentColor,
      inactiveColorPrimary: Get.isDarkMode ? Colors.white : Colors.black,
    ),
    PersistentBottomNavBarItem(
      // // textStyle: const TextStyle(color: Colors.white),
      icon: const Icon(Icons.help),
      title: ("Help"),
      activeColorPrimary:
          Get.isDarkMode ? Colors.white : Theme.of(context).accentColor,
      inactiveColorPrimary: Get.isDarkMode ? Colors.white : Colors.black,
    ),
    PersistentBottomNavBarItem(
      // // textStyle: const TextStyle(color: Colors.white),
      icon: const Icon(Icons.person),
      title: ("Profile"),
      activeColorPrimary:
          Get.isDarkMode ? Colors.white : Theme.of(context).accentColor,
      inactiveColorPrimary: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  ];
}
