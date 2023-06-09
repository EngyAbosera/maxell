import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:maxel/Models/user.dart';
import 'package:maxel/Models/user_data.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  signUp(String email, String password, String name) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
    try {
      var user = await http.post(
        url,
        body: jsonEncode(
          {
            'displayName': name,
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
      if (user.statusCode == 200) {
        var second = jsonDecode(user.body)['expiresIn'];
        var expired = DateTime.now().add(Duration(seconds: int.parse(second)));
        var time = expired.toIso8601String();
        var data = jsonDecode(user.body);
        storage.write(
          'userData',
          {
            'idToken': data['idToken'],
            'displayName': data['displayName'],
            'expired': time
          },
        );

        return user.statusCode;
      } else {
        storage.write(
          'userData',
          {'data': user.body},
        );

        return user.statusCode;
      }
    } catch (e) {
      throw e;
    }
  }

  tryAutoLogin() {
    var data = storage.read('userData');
    var expired = data['expired'];
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
      {'idToken': null, 'expired': null},
    );
  }

  Future<UserData> getUserDate(String token) async {
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
      return UserData.fromJson(jsonDecode(user.body)['users'][0]);
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

  updateEmailPass({String? email, String? token, String? password}) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyBDL8aglzcek8BAsSnFWWk197v9WlvRvgM");
    try {
      if (email != '' && password != '') {
        var user = await http.post(
          url,
          body: jsonEncode(
            {
              'idToken': token,
              'email': email,
              'password': password,
            },
          ),
        );
      } else if (email != '' && password == '') {
        var user = await http.post(
          url,
          body: jsonEncode(
            {
              'idToken': token,
              'email': email,
            },
          ),
        );
      } else if (email == '' && password != '') {
        var user = await http.post(
          url,
          body: jsonEncode(
            {
              'idToken': token,
              'password': password,
            },
          ),
        );
      }
      storage.remove('userData');
    } catch (e) {
      throw e;
    }
  }
}
