import 'package:maxel/Models/TaskData.dart';

var ALL_TASKS = [
  TaskData(
    id: 'bag1',
    imgUrl: 'assets/images/tasks/bag.png',
    title: 'Bag Task',
    tasks: [
      {'title': 'Stand up', 'isChecked': 'standStatus'},
      {'title': "Open your bag", 'isChecked': 'openStatus'},
      {'title': "Put your book in your bag", 'isChecked': 'putStatus'},
      // {'title': "Close your bag", 'isChecked': true},
    ],
    isCompleted: true,
  ),
  // TaskData(
  //   id: 'bed1',
  //   imgUrl: 'assets/images/tasks/bed.png',
  //   title: 'Bed Task',
  //   tasks: [
  //     {'title': 'Take Your Bed', 'isChecked': true},
  //     {"title": "Put Your Book on Your Bed", "isChecked": false}
  //   ],
  //   isCompleted: false,
  // ),
];
