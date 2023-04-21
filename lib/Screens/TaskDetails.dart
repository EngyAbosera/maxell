import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/Controllers/task.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:maxel/all_tasks.dart';
import 'package:maxel/them.dart';

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
  @override
  Widget build(BuildContext context) {
    final id = Get.arguments;
    final task = ALL_TASKS.firstWhere((task) => task.id == id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(task.title),
      ),
      body: Stack(
        children: [
          // ListView(
          //   shrinkWrap: true,
          //   children: task.tasks.map((e) {
          //     return ListTile(
          //       isThreeLine: true,
          //       leading: CheckboxListTile(
          //         title: Text(
          //           e,
          //           style: subHeaderStyle,
          //         ),
          //         selected: _value,
          //         value: _value,
          //         onChanged: (value) => setState(() {
          //           _value = value!;
          //         }),
          //       ),
          //     );
          //   }).toList(),
          // ),
          ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (context, i) {
              // final post = users[i];

              return Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        // singlecheckbox(notification),
                        //...notification.map(singlecheckbox).toList(),

                        
                        ListTile(
                          // value: task.tasks[i]['isChecked'],
                          // onChanged: (bool? value) {
                          //   setState(() {
                          //     _value = value!;
                          //   });
                          // },
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
    );
  }
}
