import 'package:flutter/material.dart';
import 'package:maxel/Screens/TaskDetails.dart';
import 'package:maxel/Widgets/TaskData.dart';
import 'package:maxel/all_tasks.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskData> taskData = ALL_TASKS;

    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.only(top: 20),
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        children: taskData.map((item) {
          return Column(children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    TaskDetails.routeName,
                    arguments: item.id,
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Image(
                    image: ExactAssetImage(item.imgUrl),
                    width: 150,
                    height: 150,
                  ),
                )),
          ]);
        }).toList(),
      ),
    );
  }
}
