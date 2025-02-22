import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_products_gridview.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_top_row.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/list_view_products.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/offer_container.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/product_container_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/time_container.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/time_count_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        height: ScreenUtil().screenHeight,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.center,
                colors: [
              Color(0xFFFD9376),
              Color(0xFFFD8080),
              Color(0xFFFD788B),
              Color(0xFFFDB2B1),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ])),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                const CustomTopBar(),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Find best device for your setup!',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.12.h,
                  ),
                ),
                const OfferContainer(),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hot deals🔥',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.44.h,
                      ),
                    ),
                    TimeLeftWidget()
                  ],
                ),
                SizedBox(height: 12.h),
                HoriztonalListOfProducts(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Categories',
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.44.h,
                  ),
                ),
                CategoriesGridView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
