import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/notifications/presentation/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.h,
            decoration: ShapeDecoration(
                shape: const CircleBorder(), color: Colors.white.withAlpha(20)),
            child: const Icon(
              Icons.location_on_sharp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Location',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12.sp,
                  color:
                      AppColors.backgroundColor.withOpacity(0.8999999761581421),
                  fontWeight: FontWeight.w400,
                  height: 1.33.h,
                ),
              ),
              Text(
                'Condong Catur',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.43.h,
                ),
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
            },
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: Colors.white.withAlpha(20)),
              child: const Icon(
                Icons.notifications_active_rounded,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Container(
            width: 44.w,
            height: 44.h,
            decoration: const ShapeDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/1641/b821/aa85d25374855613f3c9557b7a4b5845?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=JuthueiMBL8sBRGDv4uhU9yyPHMiR60vmgKSl~wzAAKt0gm9r0D8ZQQMLQb56jPp86XvCZbrmL8syKgUKUV~5U4XozqYLKWXssZ6QO1WhTslRDf83xTkwXWcpolaANQjEWn8VEBN~eiPEzVJDN90RLqJHvfcGVfz886WIBwrSsDWmYafXwmJD-UrFwli4R~vqlQH6heZgZr6yduS7jFiokKucDDsBO7C2Xaql8u-JnB-SSvbK9I8m504dsoLlaHCQBnd7dhDt8AxmxwEeCo5kpkarcxMm~wWoPi9sCmimhPnsRCa5vsEPX1sgIiLXhbkAfnvs8goQzvgoBFQAeykGg__',
                  ),
                  fit: BoxFit.fill),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
