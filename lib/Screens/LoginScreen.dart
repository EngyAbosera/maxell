import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Screens/CreateAccountScreen.dart';
import 'package:maxel/Screens/SplashPage.dart';
import 'package:maxel/Widgets/input_field.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:maxel/them.dart';

import '../snankBar.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreeninState();
  }
}

class LoginScreeninState extends State<LoginScreen> {
  var passvisible = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  final storage = GetStorage();
  @override
  void initState() {
    snakBarCheckInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 1000),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(50, 60, 50, 80),
                      child: Image.asset(
                        'assets/images/splash_image3.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
              ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 1500),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                      child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Login',
                      style: headerStyle,
                    ),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2000),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Plese Sign in to Continue',
                        style: subHeaderStyle,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                      margin: const EdgeInsets.only(top: 25),
                      label: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      onPressed: () async {
                        if (await Connectivity().checkConnectivity() ==
                            ConnectivityResult.none) {
                          snakBarCheckInternet();
                        } else {
                          var code = await _authController.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                          var userData = storage.read('userData');
                          if (code == 200) {
                            Get.off(SplashPage());
                          } else if (code == 400) {
                            snakBarRequired(
                                message: jsonDecode(userData['data'])['error']
                                    ['message']);
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 3500),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: TextButton(
                      child: const Text('Create Account'),
                      onPressed: () => Get.to(
                        const Create(),
                      ),
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
}
