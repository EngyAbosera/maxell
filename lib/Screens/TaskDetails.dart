import 'package:flutter/material.dart';
import 'package:maxel/all_tasks.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key}) : super(key: key);
  static const routeName = 'task_details';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final task = ALL_TASKS.firstWhere((task) => task.id == id);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(task.title),
        ),
        body: Stack(children: [
          Column(
            children: task.tasks.map((e) {
              return CheckboxListTile(
                title: Text(e),
                value: false,
                onChanged: (value) => null,
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () {},
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
