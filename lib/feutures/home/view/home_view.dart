import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/core/extension/center_extension.dart';
import 'package:ecommerceapp/core/extension/padding_extension.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/home/controller/home_controller.dart';
import 'package:ecommerceapp/feutures/home/view/widgets/all_products_list.dart';
import 'package:ecommerceapp/feutures/home/view/widgets/category_horizontal_list.dart';
import 'package:ecommerceapp/feutures/home/view/widgets/custom_banner.dart';
import 'package:ecommerceapp/feutures/home/view/widgets/custom_drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: darkC,
        title: CustomText(
          text: 'Shop Now',
          color: darkC,
        ).center(),
      ),
      drawer: const CustomDrawer(),
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBunner(size: size),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: 'Categories',
                fontWeight: FontWeight.bold,
              ).padding(10.sp, 10.sp),
              CategoryHorizontalList(),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: 'All Products',
                fontWeight: FontWeight.bold,
              ).padding(10.sp, 5.sp),
              AllProductsList(),
            ],
          ).padding(15, 10),
        );
      }),
    );
  }
}
