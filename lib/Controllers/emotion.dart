import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maxel/Widgets/emotion_status.dart';

class EmotionController extends GetxController {
  Future getStatus() async {
    final url = Uri.parse(
        'https://flutter-app-79e87-default-rtdb.firebaseio.com/status/feel.json');
    var response = await http.get(url);

    var value = jsonDecode(response.body);

    if (value.toLowerCase() == 'happy') {
      return EmotionStatus(
        status: value,
      );
    } else if (value.toLowerCase() == 'sad') {
      return EmotionStatus(
        status: value,
      );
    } else if (value.toLowerCase() == 'cry') {
      return EmotionStatus(
        status: value,
      );
    } else if (value.toLowerCase() == 'angry') {
      return EmotionStatus(
        status: value,
      );
    }
    return const EmotionStatus(
      status: 'No Emotion',
    );
  }
}
