import 'package:flutter/material.dart';
import 'package:maxel/Models/PViewData.dart';
import 'package:maxel/Screens/LoginScreen.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PView extends StatefulWidget {
  const PView({Key? key}) : super(key: key);

  @override
  State<PView> createState() => _PViewState();
}

class _PViewState extends State<PView> {
  final List<PViewData> data = [
    PViewData(title: "Be Easy Distracted", imageurl: 'assets/images/pv_3.jpg'),
    PViewData(title: "Use Calm Disclpline", imageurl: 'assets/images/pv_4.jpg'),
    PViewData(title: "Use Calm Disclpline", imageurl: 'assets/images/pv_5.jpg'),
    PViewData(title: "Use Calm Disclpline", imageurl: 'assets/images/pv_6.jpg'),
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  var _pageNum = 1;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
            controller: _pageController,
            children: data.map((item) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 150),
                    child: Image(
                      image: ExactAssetImage(item.imageurl),
                      width: width * 0.8,
                      height: height * 0.5,
                    ),
                  ),
                  if (data.last.hashCode == item.hashCode) ...[
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          width: double.infinity,
                          child: MyButton(
                            onPressed: () async {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                              SharedPreferences pres =
                                  await SharedPreferences.getInstance();
                              pres.setBool('get_started', true);
                            },
                            label: const Text(
                              'Get Started',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
                  // else ...[
                  //   Expanded(
                  //     child: Container(
                  //       margin: const EdgeInsets.all(20),
                  //       child: Align(
                  //         alignment: Alignment.bottomRight,
                  //         child: RaisedButton(
                  //           color: Theme.of(context).primaryColor,
                  //           textColor: Colors.white,
                  //           onPressed: () {
                  //             if (_pageController.hasClients) {
                  //               _pageController.animateToPage(
                  //                 _pageNum,
                  //                 duration: const Duration(milliseconds: 400),
                  //                 curve: Curves.easeInOut,
                  //               );
                  //               _pageNum++;
                  //             }
                  //           },
                  //           child: const Text('Next'),
                  //         ),
                  //       ),
                  //     ),
                  //   )
                  // ],
                ],
              );
            }).toList(),
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
            }),
        _buildCircleIndicator()
      ]),
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
