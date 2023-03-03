import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Screens/HelpScreen.dart';
import 'package:maxel/Screens/EmotionScreen.dart';
import 'package:maxel/Screens/ProfileScreen.dart';
import 'package:maxel/Screens/TaskScreen.dart';
import 'package:maxel/Screens/ControlScrenn.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


List<Widget> buildScreens() {
  return [
    const TaskScreen(),
    const EmotionScreen(),
    const HelpScreen(),
    const ProfileScreen(),
    const MControl(),
  ];
}

final List titles = ['Tasks', 'Emotion', 'Help', 'Profile', 'Control'];

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
      icon: const Icon(Icons.face),
      title: ("Emotion"),
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
    PersistentBottomNavBarItem(
      // // textStyle: const TextStyle(color: Colors.white),
      icon: const Icon(Icons.control_camera),
      title: ("Control"),
      activeColorPrimary:
          Get.isDarkMode ? Colors.white : Theme.of(context).accentColor,
      inactiveColorPrimary: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  ];
}
