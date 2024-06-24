import 'package:ecommerceapp/feutures/auth/view/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.sp,
            vertical: 10.sp,
          ),
          child: RegisterBody(),
        ),
      ),
    );
  }
}
