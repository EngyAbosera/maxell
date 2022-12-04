import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxel/all_tasks.dart';
import 'package:maxel/them.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key}) : super(key: key);
  static const routeName = 'task_details';

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    final id = Get.arguments;
    final task = ALL_TASKS.firstWhere((task) => task.id == id);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(task.title),
        ),
        body: Stack(children: [
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

                return Card(
                    elevation: 5,
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView(shrinkWrap: true, children: [
                          // singlecheckbox(notification),
                          //...notification.map(singlecheckbox).toList(),

                          CheckboxListTile(
                            value: task.tasks[i]['isChecked'],
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
                        ])));
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () {
                print(id);
              },
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Apply Task',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]));
  }
}
