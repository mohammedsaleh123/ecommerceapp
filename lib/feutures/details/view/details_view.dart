import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/core/extension/padding_extension.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/details/view/widget/data_row.dart';
import 'package:ecommerceapp/feutures/details/view/widget/details_banner.dart';
import 'package:ecommerceapp/feutures/details/view/widget/product_images.dart';
import 'package:ecommerceapp/feutures/home/model/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  DetailsView({super.key, required this.data});
  Product data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: lightC,
        title: CustomText(
          text: data.title,
          color: lightC,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsBanner(data: data),
            SizedBox(height: 12.h),
            CustomText(
              text: data.title,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              //color: lightC,
            ).padding(0, 12.h),
            SizedBox(height: 12.h),
            ProductImages(data: data),
            SizedBox(height: 12.h),
            const Divider(),
            CustomText(
              textAlign: TextAlign.center,
              text: data.description,
              fontWeight: FontWeight.w700,
              //color: lightC,
            ).padding(8.w, 12.h),
            SizedBox(height: 12.h),
            ProductDataRow(data: data).padding(8.w, 8.h),
            SizedBox(height: 12.h),
            MaterialButton(
              minWidth: Get.width,
              color: primaryC,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              onPressed: () {},
              child: CustomText(text: 'Add To Cart', color: darkC)
                  .padding(0, 12.h),
            ).paddingAll(8.h),
          ],
        ),
      ),
    );
  }
}
