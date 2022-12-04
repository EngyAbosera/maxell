import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Controllers/them_mode.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/Screens/Pview.dart';
import 'package:maxel/Screens/SplashPage.dart';
import 'package:maxel/Screens/TaskDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SharedPreferences pres = await SharedPreferences.getInstance();
  var pageview = pres.getBool('get_started');
  Widget screen = (pageview == false || pageview == null)
      ? const MyApp()
      : (AuthController().tryAutoLogin() == false
          ? GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // const Color.fromRGBO(36, 101, 241, 1)
                primaryColor: const Color.fromRGBO(36, 101, 241, 1),
                accentColor: const Color.fromRGBO(36, 101, 241, 0.7),
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              themeMode: ThemeModeChanged().theme,
              home: const LoginScreen(),
            )
          : GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // const Color.fromRGBO(36, 101, 241, 1)
                primaryColor: const Color.fromRGBO(36, 101, 241, 1),
                accentColor: const Color.fromRGBO(36, 101, 241, 0.7),
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              themeMode: ThemeModeChanged().theme,
              home: SplashPage(),
            ));

  // Widget screen = (pageview == false || pageview == null)
  //     ? const MyApp()
  //     : const LoginScreen();

  runApp(screen);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = AuthController();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // const Color.fromRGBO(36, 101, 241, 1)
        primaryColor: const Color.fromRGBO(36, 101, 241, 1),
        accentColor: const Color.fromRGBO(36, 101, 241, 0.7),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeModeChanged().theme,
      home: const PView(),
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SplashPage.routeName: (ctx) => SplashPage(),
        TaskDetails.routeName: (ctx) => const TaskDetails(),
      },
    );
  }
}
