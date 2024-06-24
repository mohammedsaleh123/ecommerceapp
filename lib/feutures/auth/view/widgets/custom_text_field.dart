import 'package:ecommerceapp/feutures/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.textController,
    required this.validator,
    this.textInputType,
    required this.obsecureText,
    this.prefixWidget,
  });
  AuthController controller = Get.find();
  final String hintText;
  TextEditingController textController = TextEditingController();
  String? Function(String?)? validator;
  TextInputType? textInputType;
  Widget? prefixWidget;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      controller: textController,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: prefixWidget,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
      ),
    );
  }
}
