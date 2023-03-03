import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:maxel/Widgets/my_button.dart';

import '../snankBar.dart';

class MControl extends StatefulWidget {
  const MControl({Key? key}) : super(key: key);

  @override
  State<MControl> createState() => _MControlState();
}

class _MControlState extends State<MControl> {
  @override
  void initState() {
    snakBarCheckInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: Colors.grey[400],
            boxShadow: [
              BoxShadow(
                color: Get.isDarkMode ? Colors.black38 : Colors.grey,
                blurRadius: 6,
                offset: const Offset(4, 8), // Shadow position
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Get.isDarkMode
                    ? const Color.fromARGB(255, 49, 50, 51)
                    : const Color.fromARGB(255, 112, 135, 233),
                Get.isDarkMode
                    ? const Color.fromARGB(97, 94, 94, 97)
                    : const Color.fromARGB(255, 76, 163, 235),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 65,
                top: -30,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_up,
                    size: 150,
                  ),
                ),
              ),
              Positioned(
                left: -30,
                top: 70,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_left,
                    size: 150,
                  ),
                ),
              ),
              Positioned(
                right: 90,
                top: 70,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_right,
                    size: 150,
                  ),
                ),
              ),
              Positioned(
                left: 65,
                bottom: 90,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 150,
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
