import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/product_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductContainerWidget(
              product: products[index],
            );
          }),
    );
  }
}
