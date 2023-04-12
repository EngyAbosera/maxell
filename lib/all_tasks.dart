import 'package:maxel/Models/TaskData.dart';

var ALL_TASKS = [
  TaskData(
    id: 'bag1',
    imgUrl: 'assets/images/tasks/bag.png',
    title: 'Bag Task',
    tasks: [
      {'title': 'Take Your Bag', 'isChecked': false},
      {'title': "Open your bag", 'isChecked': true},
      {'title': "Put your book", 'isChecked': true},
      {'title': "Close your bag", 'isChecked': true},
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
