import 'package:ecommerceapp/feutures/auth/controller/auth_controller.dart';
import 'package:ecommerceapp/feutures/auth/view/widgets/signin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignInView extends StatelessWidget {
  SignInView({super.key});
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.sp,
            vertical: 10.sp,
          ),
          child: SignInBody(),
        ),
      ),
    );
  }
}
