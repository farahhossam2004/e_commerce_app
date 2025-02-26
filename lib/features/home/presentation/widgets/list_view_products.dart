import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/product_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HoriztonalListOfProducts extends StatelessWidget {
  List<ProductModel> products = [];
  HoriztonalListOfProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(width: 16.w);
          },
          itemCount: products.length - 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductContainerWidget(
              products: products,
              product: products[index],
            );
          }),
    );
  }
}
