import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/list_view_products.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  final List<ProductModel> products;
  const ProductDetailsScreen(
      {super.key, required this.product, required this.products});
  List<ProductModel> getRelatedProducts(
      List<ProductModel> products, String category) {
    return products.where((product) => product.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> relatedProducts =
        getRelatedProducts(products, product.category!);
    num priceBefore = product.price! + 20.0;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: AppColors.textColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: 84.w,
                    height: 21.h,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: ShapeDecoration(
                        color: AppColors.labelContainerColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                    child: Text(
                      'NEW ARRIVAL',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
                    child: Text(
                      product.title!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.25.h,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$ ${product.price!.toString()}',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 20.sp,
                          color: AppColors.priceTextColor,
                          fontWeight: FontWeight.w700,
                          height: 1.20.h,
                        ),
                      ),
                      Text(
                        ' \$ $priceBefore',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.priceBeforeTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                          height: 1.33.h,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  SizedBox(
                      width: 303.w,
                      height: 285.h,
                      child: Image.network(
                        product.image!,
                        fit: BoxFit.fitHeight,
                      )),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Space Grey',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.productTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.33.h,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProductColorsOption(
                        color: Color(0xFFA6A5AA),
                        isSelected: true,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      ProductColorsOption(
                        color: Color(0xFFE8E8EA),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      ProductColorsOption(
                        color: Color(0xFFF2E0CC),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Container(
                    width: 375,
                    height: 4,
                    decoration: const BoxDecoration(
                        color: AppColors.productDividerColor),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Description',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      height: 1.44.h,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  ExpandableText(
                    product.description!,
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.secondryTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.43.h,
                    ),
                    maxLines: 3,
                    expandText: 'Read More',
                    collapseText: 'Show Less',
                    linkColor: AppColors.priceTextColor,
                    linkStyle: GoogleFonts.plusJakartaSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.43.h,
                    ),
                  ),
                  SizedBox(
                    height: 52.h,
                  ),
                  Text(
                    'Product Related',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      height: 1.44.h,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  HoriztonalListOfProducts(products: relatedProducts),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 112.h,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 56.w,
                          height: 56.h,
                          // padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFEAEAEA)),
                              borderRadius: BorderRadius.circular(34.r),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        Container(
                            width: 267.w,
                            child: CustomButton(
                                label: 'Checkout', onPressed: () {})),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductColorsOption extends StatelessWidget {
  Color color;
  bool isSelected;
  ProductColorsOption(
      {super.key, required this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40.w,
        height: 40.w,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: OvalBorder(
            side: isSelected
                ? BorderSide(
                    width: 3,
                    color: color,
                  )
                : BorderSide.none,
          ),
        ),
        child: Center(
          child: Container(
            width: 32.w,
            height: 32.w,
            decoration: ShapeDecoration(
                color: color,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.white,
                  ),
                )),
          ),
        ));
  }
}
