import 'package:flutter/material.dart';
import 'package:maxel/them.dart';

class EmotionStatus extends StatelessWidget {
  final String status;
  const EmotionStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        CircleAvatar(
          radius: 150,
          child: Image.asset(
            'assets/images/${status.toLowerCase()}.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          status,
          style: headerStyle,
        )
      ],
    );
  }
}
