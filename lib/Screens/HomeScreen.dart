import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';

import 'package:maxel/snankBar.dart';
import 'package:maxel/them.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../Models/ListOfScreens.dart';
import '../Widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _statePage = 0;
  final AuthController _authController = Get.put(AuthController());
  var user = GetStorage().read('userData');

  @override
  void initState() {
    print(user);
    super.initState();
    snakBarCheckInternet();
    _authController.getUserDate(user['idToken']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          titles[_statePage],
          style: headerStylePage,
        ),
      ),
      body: PersistentTabView(
        context,
        // controller: _controller,
        screens: buildScreens(),
        items: navBarsItems(context),
        onItemSelected: (value) => setState(() => _statePage = value),
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style13,
      ),
    );
  }
}
