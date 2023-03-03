import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Screens/HomeScreen.dart';
import 'package:maxel/Widgets/input_field.dart';
import 'package:maxel/Widgets/loading.dart';
import 'package:maxel/Widgets/my_button.dart';
import 'package:maxel/them.dart';

import '../snankBar.dart';

class UpdateName extends StatefulWidget {
  const UpdateName({Key? key}) : super(key: key);

  @override
  State<UpdateName> createState() => _UpdateNameState();
}

class _UpdateNameState extends State<UpdateName> {
  var user = (GetStorage().read('userData'));
  final AuthController _authController = Get.put(AuthController());
  final _name = TextEditingController();
  bool loading = true;

  @override
  void initState() {
    _authController.getUserDate(user['idToken']).then((value) {
      setState(() {
        _name.value = TextEditingValue(text: value.displayName);
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Profile',
          style: headerStylePage,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: loading
          ? const Loading()
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  MyInputTextField(
                    label: 'Name',
                    hint: 'name',
                    icon: const Icon(Icons.edit_note_outlined),
                    controller: _name,
                  ),
                  MyButton(
                    margin: const EdgeInsets.only(top: 25),
                    padding: const EdgeInsets.all(10),
                    label: Text(
                      'Save',
                      style: subProfileTextStyle,
                    ),
                    onPressed: () async {
                      if (await Connectivity().checkConnectivity() ==
                          ConnectivityResult.none) {
                        snakBarCheckInternet();
                      } else {
                        _authController.updateName(
                            token: user['idToken'], name: _name.text);
                        Get.off(const MyHomePage());
                        snakBarSuccess(message: 'Your Name update successfuly');
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
