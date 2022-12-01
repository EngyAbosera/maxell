import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:get/get.dart';
import 'package:maxel/Controllers/them_mode.dart';
import 'package:maxel/Screens/HomeScreen.dart';
import 'package:maxel/Screens/TaskDetails.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = 'splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        TaskDetails.routeName: (ctx) => const TaskDetails(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // const Color.fromRGBO(36, 101, 241, 1)
        primaryColor: const Color.fromRGBO(36, 101, 241, 1),
        accentColor: Colors.white,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeModeChanged().theme,
      home: Scaffold(
        body: EasySplashScreen(
          logo: Image.asset('assets/images/splash_image3.png'),
          durationInSeconds: 2,
          title: const Text(
            'Maxel',
            style: TextStyle(
                fontSize: 50,
                fontFamily: 'Fasthand',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(36, 101, 241, 1)),
          ),
          logoWidth: 200,
          showLoader: true,
          loadingText: const Text('Loading...'),
          navigator: const MyHomePage(
            title: 'Home Screen',
          ),
        ),
      ),
    );
  }
}
