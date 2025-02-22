
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/time_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLeftWidget extends StatelessWidget {
  const TimeLeftWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TimeContainer(
          timeText: '02',
        ),
        Text('  :  ',
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              height: 1.50.h,
            )),
        const TimeContainer(timeText: '12'),
        Text('  :  ',
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              height: 1.50.h,
            )),
        const TimeContainer(timeText: '00'),
      ],
    );
  }
}
