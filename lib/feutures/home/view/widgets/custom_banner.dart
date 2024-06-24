import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/feutures/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class CustomBunner extends StatelessWidget {
  CustomBunner({
    super.key,
    required this.size,
  });
  HomeController controller = Get.find();
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: secondaryC,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: controller.products == null
          ? Shimmer(
              gradient: const LinearGradient(
                colors: [offLightC, lightC],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              child: Container(
                color: offLightC,
                height: size.height * 0.2,
                width: size.width,
              ),
            )
          : CarouselSlider.builder(
              itemCount: controller.products!.products.length,
              itemBuilder: (context, index, i) {
                final data = controller.products!.products[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20.sp),
                  child: Image.network(
                    data.thumbnail,
                    height: size.height * 0.2,
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                );
              },
              options: CarouselOptions(
                height: size.height * 0.2,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: null,
                scrollDirection: Axis.horizontal,
              ),
            ),
    );
  }
}
