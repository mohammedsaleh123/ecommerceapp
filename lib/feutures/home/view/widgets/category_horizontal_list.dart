import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/core/extension/center_extension.dart';
import 'package:ecommerceapp/core/extension/padding_extension.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/home/controller/home_controller.dart';
import 'package:ecommerceapp/feutures/home/model/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class CategoryHorizontalList extends StatelessWidget {
  CategoryHorizontalList({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          height: 125.h,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return controller.categories.isNotEmpty
                  ? FutureBuilder<AllProducts>(
                      future: controller
                          .getProductByCategory(controller.categories[index]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.sp),
                                child: Image.network(
                                  snapshot.data!.products[1].thumbnail,
                                  height: 125.h,
                                  width: 125.sp,
                                  fit: BoxFit.fill,
                                ),
                              ).padding(5.w, 0),
                              Container(
                                height: 125.h,
                                width: 125.sp,
                                decoration: BoxDecoration(
                                  color: darkC.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20.sp),
                                ),
                                child: CustomText(
                                  text: controller.categories[index],
                                  color: lightC,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.center,
                                ).center(),
                              ),
                            ],
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Shimmer(
                              gradient:
                                  const LinearGradient(colors: [darkC, lightC]),
                              child: Container(
                                height: 125.h,
                                width: 125.w,
                                decoration: BoxDecoration(
                                    color: darkC,
                                    borderRadius: BorderRadius.circular(20.sp)),
                              ).paddingSymmetric(horizontal: 10));
                        }
                        return const CircularProgressIndicator().center();
                      },
                    )
                  : Container();
            },
          ),
        );
      },
    );
  }
}
