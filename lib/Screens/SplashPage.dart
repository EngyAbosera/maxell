import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:maxel/Controllers/them_mode.dart';
import 'package:maxel/Screens/HomeScreen.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/Screens/TaskDetails.dart';

class SplashPage extends StatelessWidget {
  static const routeName = 'splash_page';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.asset('assets/images/splash_image3.png'),
        durationInSeconds: 2,
        title: const Text(
          'Maxel',
          style: TextStyle(
            fontSize: 50,
            fontFamily: 'Fasthand',
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(36, 101, 241, 1),
          ),
        ),
        logoWidth: width * 0.5,
        showLoader: true,
        loadingText: const Text('Loading...'),
        navigator: const MyHomePage(),
      ),
    );
  }
}
