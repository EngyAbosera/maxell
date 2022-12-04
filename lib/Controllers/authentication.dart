import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
      storage.write(
          'signUp', jsonEncode({'data': user.body, 'code': user.statusCode}));
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
      print(user.body);
      if(user.statusCode == 200){
        var second = jsonDecode(user.body)['expiresIn'];
        var expired = DateTime.now().add(Duration(seconds: int.parse(second)));
        var time = expired.toIso8601String();
        storage.write(
          'userData',
          jsonEncode(
            {'data': user.body, 'code': user.statusCode, 'expired': time},
          ),
        );
      }else{
        storage.write(
          'userData',
          jsonEncode(
            {'data': user.body, 'code': user.statusCode},
          ),
        );

      }

    } catch (e) {
      throw e;
    }
  }

  tryAutoLogin() {
    var data = storage.read('userData');
    var expired = jsonDecode(data)['expired'];
    print(data);
    DateTime time = expired == null ? DateTime.now() : DateTime.parse(expired);
    if (time.isBefore(DateTime.now())) {
      return false;
    } else if (expired == null) {
      return false;
    }
    return true;
  }

  logout() {
    storage.write(
      'userData',
      jsonEncode(
        {'data': null, 'code': null, 'expired': null},
      ),
    );
    print(storage.getKeys());
  }

  getUserDate(String token) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
    try {
      var user = await http.post(
        url,
        body: jsonEncode(
          {
            'idToken': token,
          },
        ),
      );
      storage.write('getUser', user.body);
      // print(jsonDecode(user.body)['users'][0]['displayName']);
      // print(jsonDecode(user.body)['users'][0]['photoUrl']);
      return user.body;
    } catch (e) {
      throw e;
    }
  }

  updateName({String? name, String? token}) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
    try {
      var user = await http.post(
        url,
        body: jsonEncode(
          {'idToken': token, 'displayName': name},
        ),
      );
    } catch (e) {
      throw e;
    }
  }

  updatePassword({String? password, String? token}) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
    try {
      var user = await http.post(
        url,
        body: jsonEncode(
          {'idToken': token, 'password': password},
        ),
      );
      storage.remove('userData');
      print(user.body);
    } catch (e) {
      throw e;
    }
  }

  updateEmail({String? email, String? token}) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
    try {
      var user = await http.post(
        url,
        body: jsonEncode(
          {'idToken': token, 'email': email},
        ),
      );
      storage.remove('userData');
      print(user.body);
    } catch (e) {
      throw e;
    }
  }
}
