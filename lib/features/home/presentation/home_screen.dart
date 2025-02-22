import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/product_container_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/time_container.dart';
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
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: Row(
                    children: [
                      Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: Colors.white.withAlpha(20)),
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
                              color: AppColors.backgroundColor
                                  .withOpacity(0.8999999761581421),
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
                      Container(
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
                ),
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
                Stack(children: [
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
                ]),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TimeContainer(
                          timeText: '02',
                        ),
                        Text('  :  ',
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColors.textColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.50.h,
                            )),
                        TimeContainer(timeText: '12'),
                        Text('  :  ',
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColors.textColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.50.h,
                            )),
                        TimeContainer(timeText: '00'),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 230.h,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductContainerWidget();
                      }),
                ),
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
                SizedBox(
                  height: 600.h,
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.w,
                          mainAxisExtent: 230.h,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20.w,
                          mainAxisSpacing: 20.h),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, index) {
                        return ProductContainerWidget();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
