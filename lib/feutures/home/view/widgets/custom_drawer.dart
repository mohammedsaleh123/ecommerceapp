import 'package:ecommerceapp/core/extension/padding_extension.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/home/view/widgets/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/drawer.png',
                height: 100.h,
                width: 100.w,
              ).padding(0, 10.h),
              const Divider().padding(10.w, 5.sp),
              ListTile(
                title: CustomText(text: 'Profile'),
                leading: const Icon(Icons.person),
              ),
              const Divider().padding(60.w, 5.sp),
              ListTile(
                title: CustomText(text: 'Setting'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Get.back();
                  showBottomSheet(
                      enableDrag: true,
                      context: context,
                      builder: (context) => Setting());
                },
              ),
              const Divider().padding(60.w, 5.sp),
              ListTile(
                title: CustomText(text: 'My orders'),
                leading: const Icon(Icons.shopping_bag_outlined),
              ),
              const Divider().padding(60.w, 5.sp),
            ],
          ),
        ),
      ),
    );
  }
}
