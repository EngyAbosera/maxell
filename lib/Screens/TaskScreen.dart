import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Models/TaskData.dart';
import 'package:maxel/Screens/TaskDetails.dart';
import 'package:maxel/all_tasks.dart';
import 'package:maxel/snankBar.dart';
import 'package:http/http.dart' as http;

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String? text;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    snakBarCheckInternet();
    getRunStatus();
  }

  @override
  Widget build(BuildContext context) {
    List<TaskData> taskData = ALL_TASKS;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => getRunStatus(),
        child: ListView(
          children: taskData.map((item) {
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Get.to(const TaskDetails(), arguments: '${item.id}');
                },
                child: Card(
                  elevation: 4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 15, top: 15, right: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: loading
                              ? Colors.blueAccent
                              : (text == 'run' ? Colors.amber : Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(loading
                            ? 'Loading...'
                            : (text == 'run' ? 'Running' : 'Complete')),
                      ),
                      Column(
                        children: [
                          Image(
                            image: ExactAssetImage(item.imgUrl),
                            width: 150,
                            height: 150,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  getRunStatus() async {
    setState(() {
      loading = true;
    });
    Uri url = Uri.parse(
        'https://flutter-app-79e87-default-rtdb.firebaseio.com/tasks/task1.json');
    var response = await http.get(url).then((value) => setState(() {
          text = jsonDecode(value.body);
          loading = false;
        }));
  }
}
