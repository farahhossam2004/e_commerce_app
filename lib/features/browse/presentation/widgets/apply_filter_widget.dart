import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/browse/logic/cubit/search_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyFilterWidget extends StatefulWidget {
  const ApplyFilterWidget({super.key});

  @override
  State<ApplyFilterWidget> createState() => _ApplyFilterWidgetState();
}

class _ApplyFilterWidgetState extends State<ApplyFilterWidget> {
  double start = 20.0;
  double end = 500.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 308.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 66.67,
                height: 4,
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter',
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      start = 20;
                      end = 500;
                    });
                  },
                  child: Text(
                    'Reset',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.priceTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Container(
              width: 375,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFEAEAEA),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Price Range',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            RangeSlider(
              values: RangeValues(start, end),
              onChanged: (RangeValues value) {
                setState(() {
                  start = value.start;
                  end = value.end;
                });
              },
              labels: RangeLabels("\$${start.toInt()}", "\$${end.toInt()}"),
              max: 700,
              min: 0,
              activeColor: AppColors.labelContainerColor,
              inactiveColor: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$${start.toInt()}",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "\$${end.toInt()}",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomButton(
              label: 'Apply filter',
              onPressed: () {
                final searchCubit = context.read<SearchCubit>(); // Read it here
                searchCubit.filterProductsByPrice(start, end);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
