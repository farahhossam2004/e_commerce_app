import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/notifications/data/models/notification_model.dart';
import 'package:e_commerce_app/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> yesterdayNotifications = [
      const NotificationModel(
          iconPath: 'assets/images/discount.png',
          title: 'Special Offer! 40% Off',
          subTitle: 'Special offer for new account, valid until 20 Nov 2022'),
      const NotificationModel(
          iconPath: 'assets/images/discount.png',
          title: 'Special Offer! 50% Off',
          subTitle: 'Special offer for new account, valid until 20 Nov 2022'),
      const NotificationModel(
          iconPath: 'assets/images/card.png',
          title: 'Credit Card Connected',
          subTitle: 'Special promotion only valid today'),
      const NotificationModel(
          iconPath: 'assets/images/profile.png',
          title: 'Account Setup Successfull!',
          subTitle: 'Special promotion only valid today'),
    ];
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Notification',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.25.h,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Today',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.secondryTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.43.h,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const NotificationTile(
                iconPath: 'assets/images/discount.png',
                title: '30% Special Discount!',
                subTitle: 'Special promotion only valid today',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Divider(
                  height: 1.h,
                  color: AppColors.bordetTextInputColor,
                ),
              ),
              const NotificationTile(
                  iconPath: 'assets/images/apple.png',
                  title: 'New Apple Promotion',
                  subTitle: 'Special promo to all apple device'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Divider(
                  height: 4.h,
                  color: AppColors.bordetTextInputColor,
                ),
              ),
              Text(
                'Yesterday',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.secondryTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.43.h,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NotificationTile(
                        iconPath: yesterdayNotifications[index].iconPath,
                        title: yesterdayNotifications[index].title,
                        subTitle: yesterdayNotifications[index].subTitle);
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Divider(
                        height: 1.h,
                        color: AppColors.bordetTextInputColor,
                      ),
                    );
                  },
                  itemCount: yesterdayNotifications.length)
            ],
          ),
        ),
      ),
    );
  }
}
