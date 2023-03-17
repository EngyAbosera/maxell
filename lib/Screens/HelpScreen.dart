import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maxel/Models/help_data.dart';
import 'package:maxel/them.dart';

import '../snankBar.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    snakBarCheckInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              helpData[index].title,
              textAlign: TextAlign.right,
              style: GoogleFonts.cairo(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            childrenPadding: const EdgeInsets.all(20),
            expandedAlignment: Alignment.center,
            leading: const Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green,
            ),
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(child: helpData[index].image),
                ),
              ),
              Text(
                helpData[index].content,
                textAlign: TextAlign.right,
                style: GoogleFonts.cairo(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        },
        itemCount: helpData.length,
      ),
    );
  }
}
