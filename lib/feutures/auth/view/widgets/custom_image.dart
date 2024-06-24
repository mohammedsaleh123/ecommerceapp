import 'package:ecommerceapp/core/extension/center_extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImage extends StatelessWidget {
  CustomImage({
    super.key,
    this.height,
    this.width,
    required this.imagePath,
  });
  double? height;
  double? width;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: height,
      width: width,
    ).center();
  }
}
