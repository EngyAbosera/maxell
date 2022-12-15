import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

snakBarSuccess({required String message}) {
  Get.snackbar(
    'Success',
    message,
    icon: const Icon(
      Icons.check_circle_outline_outlined,
      color: Colors.green,
    ),
    colorText: Colors.green,
    snackPosition: SnackPosition.BOTTOM,
  );
}

snakBarRequired({required String message}) {
  Get.snackbar(
    'Required',
    message,
    icon: const Icon(
      Icons.warning_amber_rounded,
      color: Colors.red,
    ),
    colorText: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
  );
}

snakBarCheckInternet() async {
  var res = await Connectivity().checkConnectivity();

  if (res == ConnectivityResult.none) {
    snakBarRequired(message: 'Please Check Your Internet Connection!');
  }
}
