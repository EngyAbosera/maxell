// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyInputTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? secondIcon;
  final bool? obscureText;
  const MyInputTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.controller,
    this.icon,
    this.secondIcon,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0, style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0, style: BorderStyle.solid),
          ),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 25),
          hintText: hint,
          prefixIcon: icon,
          suffixIcon: secondIcon,
        ),
        obscureText: obscureText == null ? false : obscureText!,
        controller: controller,
      ),
    );
  }
}
