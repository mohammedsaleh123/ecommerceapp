import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/feutures/home/model/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailsBanner extends StatelessWidget {
  DetailsBanner({super.key, required this.data});
  Product data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.35,
      width: Get.width,
      child: Stack(
        children: [
          Image.network(
            data.thumbnail,
            fit: BoxFit.fill,
            height: Get.height * 0.35,
            width: Get.width,
          ),
          Container(
            //height: Get.height * 0.1,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [darkC, darkC.withOpacity(0.3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.3]),
            ),
          ),
        ],
      ),
    );
  }
}
