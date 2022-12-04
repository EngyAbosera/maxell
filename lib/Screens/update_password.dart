import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Screens/HomeScreen.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/Widgets/input_field.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:maxel/them.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  var user = jsonDecode(jsonDecode(GetStorage().read('userData'))['data']);
  var userData = jsonDecode(GetStorage().read('getUser'))['users'][0];
  final AuthController _authController = Get.put(AuthController());
  var _password = TextEditingController();
  var passvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Profile',
          style: headerStylePage,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            MyInputTextField(
              label: 'Password',
              hint: 'Enter new password',
              icon: const Icon(Icons.lock),
              secondIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passvisible = !passvisible;
                  });
                },
                icon:
                    Icon(passvisible ? Icons.visibility_off : Icons.visibility),
              ),
              obscureText: passvisible,
              controller: _password,
            ),
            MyButton(
              label: Text(
                'Save',
                style: subProfileTextStyle,
              ),
              onPressed: () {
                _authController.updatePassword(
                    token: user['idToken'], password: _password.text);
                Get.off(const LoginScreen());
                _snakBarSuccess();
              },
            ),
          ],
        ),
      ),
    );
  }

  _snakBarSuccess() {
    Get.snackbar(
      'Success',
      'Your Password update successfuly,Please Login Agin!',
      icon: const Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.green,
      ),
      colorText: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
