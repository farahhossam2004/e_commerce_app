import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_products_gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 56.h,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search laptop, headset..',
                  hintStyle: GoogleFonts.plusJakartaSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.50.h,
                      color: AppColors.secondryTextColor),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: AppColors.textColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34.r),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.bordetTextInputColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34.r),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.bordetTextInputColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34.r),
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.bordetTextInputColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            const CategoriesGridView()
          ],
        ),
      ),
    );
  }
}
