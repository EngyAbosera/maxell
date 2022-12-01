import 'package:flutter/material.dart';
import 'package:maxel/Controllers/them_mode.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import '../Widgets/PViewData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class PView extends StatefulWidget {
  const PView({Key? key}) : super(key: key);

  @override
  State<PView> createState() => _PViewState();
}

class _PViewState extends State<PView> {
  final List<PViewData> data = [
    PViewData(title: "Be Easy Distracted", imageurl: 'assets/images/pv_1.png'),
    PViewData(title: "Use Calm Disclpline", imageurl: 'assets/images/pv_2.png'),
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // const Color.fromRGBO(36, 101, 241, 1)
        primaryColor: const Color.fromRGBO(36, 101, 241, 1),

        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeModeChanged().theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          PageView(
              controller: _pageController,
              children: data.map((item) {
                return Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 150),
                        child: Image(image: ExactAssetImage(item.imageurl))),
                    if (data.last.hashCode != item.hashCode) ...[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                if (_pageController.hasClients) {
                                  _pageController.animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: const Text('Next'),
                            ),
                          ),
                        ),
                      )
                    ],
                    if (data.last.hashCode == item.hashCode) ...[
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () async {
                                Navigator.of(context).pushReplacementNamed(
                                    LoginScreen.routeName);
                                SharedPreferences pres =
                                    await SharedPreferences.getInstance();
                                pres.setBool('get_started', true);
                              },
                              child: const Text(
                                'Get Started',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]
                  ],
                );
              }).toList(),
              onPageChanged: (int index) {
                _currentPageNotifier.value = index;
              }),
          _buildCircleIndicator()
        ]),
      ),
    );
  }

  Widget _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: data.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}
