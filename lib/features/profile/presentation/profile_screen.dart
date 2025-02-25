import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/acc_settings_list.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/acc_settings_tile.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/general_settings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                'Profile',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: AppColors.textColor,
                  size: 22.sp,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 246.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE7F5F8),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Profile image.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Bryan Adam',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18.sp,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              Text(
                'bryan.adam87@gmail.com',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  color: AppColors.secondryTextColor,
                  fontWeight: FontWeight.w400,
                  height: 1.43.h,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0xFFE7F5F8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        Divider(
                          thickness: 4.h,
                          color: AppColors.secondryBorderColor,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Account Settings',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14.sp,
                            color: AppColors.secondryTextColor,
                            fontWeight: FontWeight.w600,
                            height: 1.43.h,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const AccountSettingsList(),
                        Divider(
                          thickness: 4.h,
                          color: AppColors.secondryBorderColor,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'General',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14.sp,
                            color: AppColors.secondryTextColor,
                            fontWeight: FontWeight.w600,
                            height: 1.43.h,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const GeneralSettingsList(),
                        Divider(
                          thickness: 4.h,
                          color: AppColors.secondryBorderColor,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        const AccountSettingsTile(
                          icon: Icons.logout_outlined,
                          title: 'Logout',
                          isLogout: true,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
