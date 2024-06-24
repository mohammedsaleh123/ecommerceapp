import 'package:ecommerceapp/core/widgets/custom_text.dart';
import 'package:ecommerceapp/feutures/home/model/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDataRow extends StatelessWidget {
  const ProductDataRow({
    super.key,
    required this.data,
  });

  final Product data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'Price: ${data.price} \$',
          fontWeight: FontWeight.w600,
          //color: lightC,
        ),
        Row(
          children: [
            CustomText(
              text: 'Rating: ${data.rating}',
              fontWeight: FontWeight.w600,
              //color: lightC,
            ),
            SizedBox(
              width: 5.w,
            ),
            const Icon(Icons.star),
          ],
        ),
        CustomText(
          text: 'Stock ${data.stock}',
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
