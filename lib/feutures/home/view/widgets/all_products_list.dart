import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/core/extension/padding_extension.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/details/view/details_view.dart';
import 'package:ecommerceapp/feutures/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AllProductsList extends StatelessWidget {
  AllProductsList({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.h,
      child: controller.products != null
          ? ListView.builder(
              itemCount: controller.products!.products.length,
              itemBuilder: (context, index) {
                final data = controller.products!.products[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => DetailsView(data: data));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.sp),
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: darkC.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.sp),
                          child: Image.network(
                            data.thumbnail,
                            fit: BoxFit.fill,
                            height: 200.h,
                            width: 250.w,
                          ),
                        ).padding(0, 10.sp),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          top: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: lightC,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                child: CustomText(
                                  text: data.brand,
                                  color: darkC,
                                ).padding(8.sp, 4.sp),
                              ),
                              Row(
                                children: [
                                  CustomText(text: data.rating.toString()),
                                  SizedBox(width: 4.w),
                                  const Icon(Icons.star),
                                ],
                              ),
                              CustomText(text: data.title),
                            ],
                          ).padding(8, 8),
                        ),
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8.sp, vertical: 8.sp),
                            decoration: BoxDecoration(
                              color: primaryC,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: CustomText(
                              text: '${data.price} \$',
                              fontSize: 16.sp,
                              color: darkC,
                            ).padding(8.sp, 4.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Container(),
    );
  }
}
