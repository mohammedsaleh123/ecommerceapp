import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/auth/controller/auth_controller.dart';
import 'package:ecommerceapp/feutures/auth/view/signin_view.dart';
import 'package:ecommerceapp/feutures/auth/view/widgets/custom_button.dart';
import 'package:ecommerceapp/feutures/auth/view/widgets/custom_image.dart';
import 'package:ecommerceapp/feutures/auth/view/widgets/custom_text_field.dart';
import 'package:ecommerceapp/feutures/home/view/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});
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
            imagePath: 'assets/images/signup.png',
            height: size.height * 0.3,
            width: size.width * 0.5,
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomTextField(
            obsecureText: false,
            textController: controller.registerEmailController,
            hintText: 'email',
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              controller.registerEmailController.text = value!;
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
            textController: controller.registerPasswordController,
            hintText: 'password',
            textInputType: TextInputType.text,
            validator: (value) {
              controller.registerPasswordController.text = value!;
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
          CustomTextField(
            obsecureText: true,
            textController: controller.registerPasswordConfirmController,
            hintText: 'confirm password',
            textInputType: TextInputType.text,
            validator: (value) {
              controller.registerPasswordConfirmController.text = value!;
              String confirm = controller.registerPasswordController.text;
              if (value == '') {
                return 'password  is required';
              }
              if (value.length < 6) {
                return 'password must be at least 6 charactar';
              }
              if (value != confirm) {
                return 'confirm password dont match password';
              }

              return null;
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomButton(
            text: 'Register',
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
                text: 'already have an acount ?',
                fontSize: 16.sp,
              ),
              SizedBox(
                width: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => SignInView());
                },
                child: CustomText(
                  text: 'Login',
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
