import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/Screens/SplashPage.dart';
import 'package:maxel/Widgets/input_field.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:maxel/them.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<Create> {
  var passvisible = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          color: Themes.primaryColor,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 1000),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 1000),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 30, left: 20),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Please Fill the input blow here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
              ),
              // AnimationConfiguration.synchronized(
              //   child: SlideAnimation(
              //     duration: const Duration(milliseconds: 1500),
              //     verticalOffset: 70,
              //     child: FadeInAnimation(
              //       child: MyInputTextField(
              //         label: "Name",
              //         hint: "Enter Your Name",
              //         icon: const Icon(
              //           Icons.person,
              //           color: Colors.blue,
              //         ),
              //         controller: mycontroller,
              //       ),
              //     ),
              //   ),
              // ),
              // AnimationConfiguration.synchronized(
              //   child: SlideAnimation(
              //     duration: const Duration(milliseconds: 2000),
              //     verticalOffset: 70,
              //     child: FadeInAnimation(
              //       child: MyInputTextField(
              //         label: "Phone",
              //         hint: "Enter Your Number",
              //         icon: const Icon(
              //           Icons.phone,
              //           color: Colors.blue,
              //         ),
              //         controller: mycontroller,
              //       ),
              //     ),
              //   ),
              // ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2500),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: MyInputTextField(
                      label: "E-mail",
                      hint: "abcdef@gmail.com",
                      icon: const Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      controller: _emailController,
                    ),
                  ),
                ),
              ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 3000),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: MyInputTextField(
                      label: "Password",
                      hint: "Enter Password",
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      secondIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passvisible = !passvisible;
                          });
                        },
                        icon: Icon(passvisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      obscureText: passvisible,
                      controller: _passwordController,
                    ),
                  ),
                ),
              ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 3500),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: MyButton(
                      label: const Text(
                        "CREATE ACCOUNT",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      onPressed: () async {
                        var user = await _authController.signUp(
                            _emailController.text, _passwordController.text);
                        var userData =
                            jsonDecode(storage.read('userDataSignUp'));
                        if (userData['code'] == 200) {
                          Get.back();
                          _snakBarSuccess();
                        } else if (userData['code'] == 400) {
                          _snakBar(
                              jsonDecode(userData['data'])['error']['message']);
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 3500),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          child: const Text('Sign in'),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _snakBar(String message) {
    Get.snackbar(
      'Required',
      message,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: Colors.red,
      ),
      colorText: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  _snakBarSuccess() {
    Get.snackbar(
      'Account Created',
      'Account Created Successfly,Please Login!',
      icon: const Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.green,
      ),
      colorText: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
