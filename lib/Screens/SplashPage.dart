import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:maxel/Screens/HomeScreen.dart';
import 'package:maxel/Widgets/splash_screen.dart';

class SplashPage extends StatelessWidget {
  static const routeName = 'splash_page';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: EasySplashScreen(
        logo: AnimationConfiguration.synchronized(
          child: SlideAnimation(
            duration: const Duration(milliseconds: 1500),
            verticalOffset: 50,
            child: FadeInAnimation(
              child: Image.asset('assets/images/splash_image3.png'),
            ),
          ),
        ),
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
        loadingText: Text(
          'LOADING...',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'mar',
            color: Colors.grey[900],
          ),
        ),
        navigator: const MyHomePage(),
      ),
    );
  }
}
