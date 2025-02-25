import 'package:e_commerce_app/features/profile/data/models/settings_model.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/acc_settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AccountSettingsList extends StatelessWidget {
  const AccountSettingsList({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    List<SettingsModel> acc_settings = [
      SettingsModel(icon: Icons.location_on_outlined, title: 'Address'),
      SettingsModel(icon: Icons.payment, title: 'Payment Method'),
      SettingsModel(
          icon: Icons.notifications_active_outlined, title: 'Notification'),
      SettingsModel(icon: Icons.security, title: 'Account Security'),
    ];
    return Container(
      height: 280.h,
      child: ListView.separated(
          // shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return AccountSettingsTile(
                icon: acc_settings[index].icon,
                title: acc_settings[index].title);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 16.h,
            );
          },
          itemCount: 4),
    );
  }
}