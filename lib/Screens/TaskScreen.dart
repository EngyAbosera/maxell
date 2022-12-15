import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Models/TaskData.dart';
import 'package:maxel/Screens/TaskDetails.dart';
import 'package:maxel/all_tasks.dart';
import 'package:maxel/snankBar.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    snakBarCheckInternet();
  }

  @override
  Widget build(BuildContext context) {
    List<TaskData> taskData = ALL_TASKS;

    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.only(top: 20),
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        children: taskData.map((item) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(const TaskDetails(), arguments: '${item.id}');
                },
                child: Card(
                  elevation: 4,
                  child: Image(
                    image: ExactAssetImage(item.imgUrl),
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
