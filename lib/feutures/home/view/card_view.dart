import 'package:ecommerce_kit/ecommerce_kit.dart';
import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/core/extension/center_extension.dart';
import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/home/controller/home_controller.dart';
import 'package:ecommerceapp/feutures/home/view/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  HomeController controller = Get.find();

  int productQuantity = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: darkC,
        title: CustomText(text: 'My Card').center(),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
          child: EcommerceElement.cartItem(
        productQuantity: productQuantity,
        decreaseQuantity: () {
          productQuantity++;
          setState(() {});
        },
        increaseQuantity: () {
          productQuantity--;
          setState(() {});
        },
        removeItem: () {
          setState(() {});
        },
      )),
    );
  }
}
