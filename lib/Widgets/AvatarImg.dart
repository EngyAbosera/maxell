import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:get_storage/get_storage.dart';

class AvatarImg extends StatefulWidget {
  final double? radius;
  final Widget? child;
  const AvatarImg({this.radius, this.child});

  @override
  State<AvatarImg> createState() => _AvatarImgState();
}

class _AvatarImgState extends State<AvatarImg> {
  var userData = jsonDecode(GetStorage().read('getUser'))['users'][0];

  @override
  Widget build(BuildContext context) {
    var image = GetStorage().read('imagePath');
    var imageUrl = userData['photoUrl'];
    return CircleAvatar(
      backgroundImage: image == null
          ? const AssetImage('assets/images/no_image.webp')
          :
          // FileImage(File(image)) as ImageProvider,
          (imageUrl == null
              ? FileImage(File(image))
              : NetworkImage(imageUrl) as ImageProvider),
      radius: widget.radius,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        alignment: Alignment.bottomCenter,
        child: widget.child,
      ),
    );
  }
}
