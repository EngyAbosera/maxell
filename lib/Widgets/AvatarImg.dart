// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AvatarImg extends StatefulWidget {
  final double? radius;
  final Widget? child;
  final String? url;
  const AvatarImg({
    Key? key,
    this.radius,
    this.child,
    required this.url,
  }) : super(key: key);


  @override
  State<AvatarImg> createState() => _AvatarImgState();
}

class _AvatarImgState extends State<AvatarImg> {
  @override
  Widget build(BuildContext context) {
    var image = GetStorage().read('imagePath');
    return CircleAvatar(
      backgroundImage: image == null
          ? const AssetImage('assets/images/no_image.webp')
          :
          // FileImage(File(image)) as ImageProvider,
          (widget.url == null
              ? FileImage(File(image))
              : NetworkImage('${widget.url}') as ImageProvider),
      radius: widget.radius,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        alignment: Alignment.bottomCenter,
        child: widget.child,
      ),
    );
  }
}
