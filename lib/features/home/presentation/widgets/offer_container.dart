
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferContainer extends StatelessWidget {
  const OfferContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: 335.w,
        height: 210.h,
        // color: Colors.amber,
      ),
      Positioned(
        top: 20,
        child: Container(
          padding:
              EdgeInsets.only(left: 24.w, top: 26.h, bottom: 22.h),
          width: 335.w,
          height: 178.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: const DecorationImage(
                  image:
                      AssetImage('assets/images/Background.png'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Bing \nWireless \nEarphone',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.07.h,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'See Offer',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.50.h,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right_alt_sharp,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
          top: 0,
          right: 8,
          child: Image.asset('assets/images/headphones.png')),
    ]);
  }
}
