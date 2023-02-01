// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:maxel/them.dart';

class MyButton extends StatelessWidget {
  final Widget label;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function() onPressed;

  const MyButton({
    Key? key,
    required this.label,
    this.margin,
    this.padding,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Themes.primaryColor),
          padding: MaterialStateProperty.all(
            padding,
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: label,
      ),
    );
  }
}
