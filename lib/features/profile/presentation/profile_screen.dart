import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/profile/data/models/settings_model.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/acc_settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingsModel> acc_settings = [
      SettingsModel(icon: Icons.location_on_outlined, title: 'Address'),
      SettingsModel(icon: Icons.payment, title: 'Payment Method'),
      SettingsModel(
          icon: Icons.notifications_active_outlined, title: 'Notification'),
      SettingsModel(icon: Icons.security, title: 'Account Security'),
    ];
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE7F5F8),
                Colors.white,
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Color(0xFFE7F5F8),
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
                      // ListView.separated(
                      //     itemBuilder: (context, index) {
                      //       return AccountSettingsTile(
                      //           icon: acc_settings[index].icon,
                      //           title: acc_settings[index].title);
                      //     },
                      //     separatorBuilder: (context, index) {
                      //       return SizedBox(
                      //         height: 16.h,
                      //       );
                      //     },
                      //     itemCount: 4)
                    ],
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
