import 'package:ecommerceapp/core/extension/padding_extension.dart';
import 'package:ecommerceapp/feutures/home/model/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductImages extends StatelessWidget {
  ProductImages({super.key, required this.data});
  Product data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.images.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.sp)),
              elevation: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.sp),
                child: Image.network(
                  data.images[index],
                  fit: BoxFit.fill,
                  height: Get.height * 0.2,
                  width: Get.width * 0.45,
                ).padding(4.w, 0),
              ),
            );
          }),
    );
  }
}
