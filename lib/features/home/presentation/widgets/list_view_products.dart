
import 'package:e_commerce_app/features/home/presentation/widgets/product_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoriztonalListOfProducts extends StatelessWidget {
  const HoriztonalListOfProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductContainerWidget();
          }),
    );
  }
}
