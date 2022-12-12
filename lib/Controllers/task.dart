import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TaskController extends GetxController {
  applyTask() async {
    var url = Uri.parse(
        'https://flutter-app-79e87-default-rtdb.firebaseio.com/tasks.json');
    var task = await http.put(
      url,
      body: jsonEncode({
        'task1': 'run',
      }),
    );
  }
}
