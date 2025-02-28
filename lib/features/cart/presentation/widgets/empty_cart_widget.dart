
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 44.h,
        ),
        Container(
          width: 201,
          height: 201,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Image.asset('assets/images/cart.png'),
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          'Your cart is an empty!',
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            height: 1.40.h,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
            'Looks like you haven\'t added anything to your cart yet',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.secondryTextColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.43.h,
            )),
      ],
    );
  }
}