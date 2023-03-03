import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black38,
        child: LoadingAnimationWidget.hexagonDots(
          color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor,
          size: 100,
        ),
      ),
    );
  }
}
