import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/core/extension/padding_extension.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPress,
  });
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: primaryC,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      onPressed: onPress,
      child: CustomText(
        text: text,
        color: darkC,
      ).padding(0, 20.sp),
    );
  }
}
