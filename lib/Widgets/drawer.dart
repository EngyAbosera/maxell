import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/them_mode.dart';
import 'package:maxel/Models/user_data.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/Widgets/AvatarImg.dart';
import 'package:maxel/Widgets/loading.dart';

import '../Controllers/authentication.dart';
import '../Screens/update_email.dart';
import '../Screens/update_name.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final AuthController _authController = Get.put(AuthController());
  var user = GetStorage().read('userData');
  UserData? userData;
  bool loading = true;

  getData() {
    _authController.getUserDate(user['idToken']).then((value) {
      setState(() {
        userData = value;
      });
    }).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  get subProfileTextStyle => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          loading
              ? const Loading()
              : DrawerHeader(
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.black26
                        : Theme.of(context).accentColor,
                  ),
                  child: Column(
                    children: [
                      AvatarImg(
                        url: userData!.photoUrl,
                        radius: 40,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        userData!.displayName,
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
