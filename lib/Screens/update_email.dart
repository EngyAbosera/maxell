import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/Widgets/input_field.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:maxel/snankBar.dart';
import 'package:maxel/them.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({Key? key}) : super(key: key);

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  var user = jsonDecode(jsonDecode(GetStorage().read('userData'))['data']);
  var userData = jsonDecode(GetStorage().read('getUser'))['users'][0];
  final AuthController _authController = Get.put(AuthController());
  var _email = TextEditingController();
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
              label: userData['email'],
              hint: userData['email'],
              icon: const Icon(Icons.email),
              controller: _email,
            ),
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
              onPressed: () async {
                if (await Connectivity().checkConnectivity() ==
                    ConnectivityResult.none) {
                  snakBarCheckInternet();
                } else {
                  _authController.updateEmailPass(
                    token: user['idToken'],
                    email: _email.text,
                    password: _password.text,
                  );
                  Get.off(const LoginScreen());
                  snakBarSuccess(
                      message:
                          'Your Email update successfuly,Please Login Agin!');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
