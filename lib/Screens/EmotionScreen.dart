import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Controllers/emotion.dart';
import 'package:maxel/Widgets/loading.dart';

class EmotionScreen extends StatefulWidget {
  const EmotionScreen({Key? key}) : super(key: key);

  @override
  State<EmotionScreen> createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  final _statusController = Get.put(EmotionController());

  bool loading = true;
  Widget? emotion;
  @override
  void initState() {
    super.initState();
    _statusController.getStatus().then((value) {
      setState(() {
        emotion = value;
      });
    }).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator (
        onRefresh: () => onRefresh(),
        child: loading ? const Loading() : ListView(children: [Center(child: emotion)])),
    );
  }

  Future<void> onRefresh() async{
     setState(() {
              loading = true;
            });
          await _statusController.getStatus().then((value) {
            setState(() {
              emotion = value;
            });
          }).then((value) {
            setState(() {
              loading = false;
            });
          });
  }
}
