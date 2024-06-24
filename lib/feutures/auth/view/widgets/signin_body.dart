import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/auth/controller/auth_controller.dart';
import 'package:ecommerceapp/feutures/auth/view/register_view.dart';
import 'package:ecommerceapp/feutures/auth/view/widgets/custom_button.dart';
import 'package:ecommerceapp/feutures/auth/view/widgets/custom_image.dart';
import 'package:ecommerceapp/feutures/auth/view/widgets/custom_text_field.dart';
import 'package:ecommerceapp/feutures/home/view/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignInBody extends StatelessWidget {
  SignInBody({super.key});
  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: controller.signInFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomImage(
            imagePath: 'assets/images/login.png',
            height: size.height * 0.3,
            width: size.width * 0.5,
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomTextField(
            obsecureText: false,
            textController: controller.signinEmailController,
            hintText: 'email',
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              controller.signinEmailController.text = value!;
              if (value == '') {
                return 'email is required';
              }
              if (!GetUtils.isEmail(value)) {
                return 'wrong email';
              }

              return null;
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomTextField(
            obsecureText: true,
            textController: controller.signinPasswordController,
            hintText: 'password',
            textInputType: TextInputType.text,
            validator: (value) {
              controller.signinPasswordController.text = value!;
              if (value == '') {
                return 'password  is required';
              }
              if (value.length < 6) {
                return 'password must be at least 6 charactar';
              }

              return null;
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomButton(
            text: 'Login',
            onPress: () {
              controller.signInFormKey.currentState!.validate()
                  ? Get.offAll(() => const NavBarView())
                  : Get.snackbar(
                      'error',
                      'please complete fields',
                      backgroundColor: lightC,
                    );
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'new remember ?',
                fontSize: 16.sp,
              ),
              SizedBox(
                width: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.off(() => const RegisterView());
                },
                child: CustomText(
                  text: 'Register',
                  color: primaryC,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
