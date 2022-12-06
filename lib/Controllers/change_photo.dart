import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ChangePhoto extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var storage = GetStorage();

  upload() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    storage.write('imagePath', image?.path);
    print(storage.read('imagePath'));
  }
}
