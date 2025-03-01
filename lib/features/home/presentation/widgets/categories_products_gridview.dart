import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/product_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridView extends StatelessWidget {
  List<ProductModel> products = [];
  CategoriesGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 640.h,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.w,
              mainAxisExtent: 230.h,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h),
          itemCount: products.length,
          itemBuilder: (BuildContext context, index) {
            return ProductContainerWidget(
              products: products,
              product: products[index],
            );
          }),
    );
  }
}
