import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodContainer extends StatelessWidget {
  const PaymentMethodContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Payment Method',
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: 335.w,
          height: 76.h,
          padding: EdgeInsets.only(
            top: 16.h,
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: const BorderSide(
                  color: AppColors.bordetTextInputColor,
                )),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image:
                        AssetImage('assets/images/mastercard.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r)),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MasterCard',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.43.h,
                      ),
                    ),
                    Text(
                      '**** **** 0783 7873',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.secondryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.33.h,
                      ),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
