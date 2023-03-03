import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:maxel/Controllers/authentication.dart';
import 'package:maxel/Controllers/change_photo.dart';
import 'package:maxel/Models/user_data.dart';
import 'package:maxel/Widgets/AvatarImg.dart';
import 'package:maxel/Widgets/loading.dart';
import 'package:maxel/them.dart';
import '../snankBar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController _authController = Get.put(AuthController());
  final ChangePhoto _changePhoto = Get.put(ChangePhoto());
  var user = GetStorage().read('userData');
  UserData? userData;

  bool loading = true;

  getData() {
    _authController.getUserDate(user['idToken']).then((value) {
      setState(() {
        userData = value;
      });
    }).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    snakBarCheckInternet();
  }

  @override
  Widget build(BuildContext context) {
      var passwordUpdate = loading ? DateTime.now() :
          DateTime.fromMillisecondsSinceEpoch(userData!.passwordUpdatedAt);
      var lastLoginAt = loading ? DateTime.now() :
          DateTime.fromMillisecondsSinceEpoch(int.parse(userData!.lastLoginAt));
      var createdAt = loading ? DateTime.now() :
          DateTime.fromMillisecondsSinceEpoch(int.parse(userData!.createdAt));
    return Scaffold(
      body: loading
          ? const Loading()
          : RefreshIndicator(
              onRefresh: () => getData(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Text(userData['photoUrl']),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => _changePhoto.upload(),
                      child: AvatarImg(
                        url: userData!.photoUrl,
                        radius: 55,
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Name : ',
                                  style: profileTextStyle,
                                ),
                                Text(
                                  userData!.displayName ?? 'No Name',
                                  style: subProfileTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Email : ',
                                  style: profileTextStyle,
                                ),
                                Text(
                                  userData!.email ?? 'No Email',
                                  style: subProfileTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Email Verified : ',
                                  style: profileTextStyle,
                                ),
                                Text(
                                  userData!.emailVerified ? 'Yes' : 'No',
                                  style: subProfileTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Password Updated At : ',
                              style: profileTextStyle,
                            ),
                            Text(
                              DateFormat('MM/dd/yyyy, hh:mm a')
                                  .format(passwordUpdate),
                              style: subProfileTextStyle,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Last Login At : ',
                              style: profileTextStyle,
                            ),
                            Text(
                              DateFormat('MM/dd/yyyy, hh:mm a')
                                  .format(lastLoginAt),
                              style: subProfileTextStyle,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Account Created At : ',
                              style: profileTextStyle,
                            ),
                            Text(
                              DateFormat('MM/dd/yyyy, hh:mm a')
                                  .format(createdAt),
                              style: subProfileTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
