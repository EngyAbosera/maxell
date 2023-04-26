import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Controllers/task.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:maxel/all_tasks.dart';
import 'package:maxel/them.dart';
import 'package:http/http.dart' as http;
import '../snankBar.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key}) : super(key: key);
  static const routeName = 'task_details';

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool _value = false;
  TaskController _taskController = Get.put(TaskController());

  var readyUrl =
      'https://flutter-app-79e87-default-rtdb.firebaseio.com/ready/status.json';
  var openUrl =
      'https://flutter-app-79e87-default-rtdb.firebaseio.com/open/status.json';
  var putUrl =
      'https://flutter-app-79e87-default-rtdb.firebaseio.com/put/status.json';

  String? readyStatus;
  String? openStatus;
  String? putStatus;

  Future _getStatus(String link) async {
    final url = Uri.parse(link);
    try {
      final response = await http.get(url);
      return jsonDecode(response.body);
    } catch (error) {
      throw error;
    }
  }

  Future _setStatus(String link) async {
    final url = Uri.parse(link);
    try {
      final response = await http.put(url, body: jsonEncode('notDone'));
      return response.statusCode;
    } catch (error) {
      throw error;
    }
  }

  Future<void> _runStatus() async{
    await _getStatus(readyUrl).then((value) {
      setState(() {
        readyStatus = value;
      });
    });

    await _getStatus(openUrl).then((value) {
      setState(() {
        openStatus = value;
      });
    });

    await _getStatus(putUrl).then((value) {
      setState(() {
        putStatus = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _runStatus();
  }

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments;
    List statuses = [readyStatus, openStatus, putStatus];
    final task = ALL_TASKS.firstWhere((task) => task.id == id);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(task.title),
        ),
        body: RefreshIndicator(
          onRefresh: () => _runStatus(),
          child: Stack(
            children: [
              ListView.builder(
                itemCount: task.tasks.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            CheckboxListTile(
                              value: statuses[i] == 'Done' ? true : false,
                              onChanged: (bool? value) {
                                setState(() {
                                  _value = value!;
                                });
                              },
                              title: Text(
                                task.tasks[i]['title'],
                                style: subHeaderStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 20),
                child: MyButton(
                  padding: const EdgeInsets.all(15),
                  onPressed: () async {
                    if (await Connectivity().checkConnectivity() ==
                        ConnectivityResult.none) {
                      snakBarCheckInternet();
                    } else {
                      _taskController.applyTask();
                      _setStatus(readyUrl);
                      _setStatus(openUrl);
                      _setStatus(putUrl);
                      Get.back();
                      snakBarSuccess(message: 'Task Applied Successfuly!');
                    }
                  },
                  label: const Text(
                    'Apply Task',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
