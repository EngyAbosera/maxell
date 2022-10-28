import 'package:flutter/material.dart';
import 'package:maxel/Screens/Pview.dart';
import 'package:maxel/Screens/SplashPage.dart';
import 'package:maxel/Screens/TaskDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pres = await SharedPreferences.getInstance();
  var pageview = pres.getBool('get_started');
  Widget screen =
      (pageview == false || pageview == null) ? MyApp() : SplashPage();

  runApp(screen);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // const Color.fromRGBO(36, 101, 241, 1)
          primaryColor: Color.fromRGBO(36, 101, 241, 1),
          accentColor: const Color.fromRGBO(36, 101, 241, 0.7)),
      home: const PView(),
      routes: {
        '/splash': (ctx) => const SplashPage(),
        '/task_details':(ctx) => const TaskDetails(),
      },
    );
  }
}
