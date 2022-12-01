import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final storage = GetStorage();
  signUp(String email, String password) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
    try {
      var user = await http.post(
        url,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      storage.write('userDataSignUp',
          jsonEncode({'data': user.body, 'code': user.statusCode}));
    } catch (e) {
      print(e);
    }
  }

  login(String email, String password) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
    try {
      var user = await http.post(
        url,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      storage.write(
          'userData', jsonEncode({'data': user.body, 'code': user.statusCode}));
    } catch (e) {
      throw e;
    }
  }

  tryAutoLogin() {
    var isAuth = storage.getKeys().toString().contains('userData');
    if (isAuth) {
      return true;
    }
    return false;
  }

  logout() {
    storage.remove('userData');
  }
}
