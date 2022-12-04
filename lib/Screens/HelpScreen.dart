import 'package:flutter/material.dart';
import 'package:maxel/Models/help_data.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              helpData[index].title,
              textAlign: TextAlign.right,
            ),
            childrenPadding: const EdgeInsets.all(20),
            expandedAlignment: Alignment.center,
            leading: const Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green,
            ),
            children: [
              Text(
                helpData[index].content,
                textAlign: TextAlign.right,
              )
            ],
          );
        },
        itemCount: helpData.length,
      ),
    );
  }
}
