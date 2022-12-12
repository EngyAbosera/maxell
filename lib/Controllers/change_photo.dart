
import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
class ChangePhoto extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var storage = GetStorage();

  upload() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    storage.write('imagePath', image?.path);

    // Upload Photo to firebase but it very slow
    try {
      var file = FirebaseStorage.instance
          .ref()
          .child('user_images/${DateTime.now().millisecondsSinceEpoch}');
      var upload = await file.putFile(File(image!.path));
      var path = await file.getDownloadURL();

      var user = jsonDecode(jsonDecode(GetStorage().read('userData'))['data']);

      final url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
      await http.post(
        url,
        body: jsonEncode(
          {
            'idToken': user['idToken'],
            'photoUrl': path,
          },
        ),
      );

      print(path);
    } catch (e) {
      print(e);
    }
  }
}
