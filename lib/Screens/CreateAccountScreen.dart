import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Screens/SplashPage.dart';
import 'package:maxel/Widgets/input_field.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:maxel/them.dart';
import 'package:http/http.dart' as http;

import '../snankBar.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<Create> {
  var confirmpassvisible = true;
  var passvisible = true;
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  final storage = GetStorage();

  @override
  void initState() {
    snakBarCheckInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.grey[900] : Colors.white,
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
                        child: Text(
                          'Create Account',
                          style: headerStyle,
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
                      child: Text('Please Fill the input blow here',
                          style: subHeaderStyle),
                    ),
                  ),
                ),
              ),
              AnimationConfiguration.synchronized(
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 1500),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: MyInputTextField(
                      label: "Name",
                      hint: "Enter Your Name",
                      icon: const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      controller: _nameController,
                    ),
                  ),
                ),
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
                  duration: const Duration(milliseconds: 3000),
                  verticalOffset: 70,
                  child: FadeInAnimation(
                    child: MyInputTextField(
                      label: "Confirm Password",
                      hint: "Confirm Password",
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      secondIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            confirmpassvisible = !confirmpassvisible;
                          });
                        },
                        icon: Icon(confirmpassvisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      obscureText: confirmpassvisible,
                      controller: _confirmPasswordController,
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
                        "CREATE ACCOUNT",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      onPressed: () async {
                        await SignUpMethod();
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
                      child: const Text('Sign in'),
                      onPressed: () => Get.back(),
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

  Future Sendemail() async {
    const serviceid = 'service_juo9ipx';
    const templetid = 'template_6o6sl7c';
    const userid = 'tMpqQdlnCFNNCeXOB';
    Uri url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content_Type': 'application/json',
      },
      body: jsonEncode({
        'serviceid': serviceid,
        'templetid': templetid,
        'userid': userid,
        'templet_para': {
          'name': _nameController.text,
          'email': _emailController.text,
        }
      }),
    );
  }

  Future<void> SignUpMethod() async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      await snakBarCheckInternet();
    } else {
      if (_passwordController.text != _confirmPasswordController.text) {
        snakBarRequired(message: 'Password not the same');
      } else {
        await Sendemail();
        await _authController.signUp(_emailController.text,
            _passwordController.text, _nameController.text);
        var userData = jsonDecode(storage.read('signUp'));
        if (userData['code'] == 200) {
          _authController.login(
              _emailController.text, _passwordController.text);
          Get.off(SplashPage());
          snakBarSuccess(message: 'Account Created Successfly,Please Login!');
        } else if (userData['code'] == 400) {
          snakBarRequired(
              message: jsonDecode(userData['data'])['error']['message']);
        }
      }
    }
  }
}
