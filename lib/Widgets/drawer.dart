import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/them_mode.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/Widgets/AvatarImg.dart';

import '../Controllers/authentication.dart';
import '../Screens/update_email.dart';
import '../Screens/update_name.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final AuthController _authController = Get.put(AuthController());

  get subProfileTextStyle => null;
  @override
  Widget build(BuildContext context) {
    var userData = jsonDecode(GetStorage().read('getUser'))['users'][0];
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? Colors.black26
                  : Theme.of(context).accentColor,
            ),
            child: Column(
              children: [
                const AvatarImg(
                  radius: 40,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  userData['displayName'] ?? 'No Name',
                  style: subProfileTextStyle,
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Change Name'),
            onTap: () => Get.to(const UpdateName()),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Change E-mail / Password '),
            onTap: () => Get.to(const UpdateEmail()),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Get.isDarkMode ? Icons.sunny : Icons.nightlight,
              size: 24,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            title: const Text('Dark Mode '),
            onTap: () {
              ThemeModeChanged().switchTheme();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              _authController.logout();
              Get.off(const LoginScreen());
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
