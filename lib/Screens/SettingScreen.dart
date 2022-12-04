import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Controllers/them_mode.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/them.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _value = Get.isDarkMode ? true : false;
  final AuthController _authController = Get.put(AuthController());
  // final ThemeModeChanged _themeModeChanged = Get.put(ThemeModeChanged());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark Mode',
                        style: subHeaderStyle,
                      ),
                      Switch(
                        onChanged: (value) {
                          ThemeModeChanged().switchTheme();
                          setState(() {
                            _value = value;
                          });
                        },
                        value: _value,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text(
                          'Logout',
                          style: subHeaderStyle,
                        ),
                        onPressed: () {
                          _authController.logout();
                          Get.off(const LoginScreen());
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.logout),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
