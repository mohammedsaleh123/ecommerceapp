import 'package:ecommerceapp/core/extension/padding_extension.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/home/controller/home_controller.dart';
import 'package:ecommerceapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Setting extends StatelessWidget {
  Setting({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.5,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomText(text: 'Setting', fontSize: 18.sp).padding(0, 10.h),
            const Divider(),
            GetBuilder<HomeController>(builder: (controller) {
              return SwitchListTile(
                  title: CustomText(text: 'Dark Mode'),
                  value: isDark,
                  onChanged: (value) {
                    ThemeDataService().saveThemePreference(value);
                    controller.changTheme(value);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
