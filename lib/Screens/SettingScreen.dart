import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Screens/LoginScreen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.put(AuthController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    child: const Text('Logout'),
                    onPressed: () {
                      _authController.logout();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
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
