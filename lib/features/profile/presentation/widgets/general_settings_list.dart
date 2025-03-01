import 'package:e_commerce_app/features/profile/data/models/settings_model.dart';
import 'package:e_commerce_app/features/profile/presentation/privacy_policy_screen.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/acc_settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralSettingsList extends StatelessWidget {
  const GeneralSettingsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<SettingsModel> generalSettings = [
      SettingsModel(
          icon: Icons.people_outline_rounded, title: 'Invite Friends'),
      SettingsModel(icon: Icons.lock_outline, title: 'Privacy Policy'),
      SettingsModel(icon: Icons.info_outline, title: 'Help Center'),
    ];
    return Container(
      height: 220.h,
      child: ListView.separated(
          // shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 1) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen()));
                },
                child: AccountSettingsTile(
                    icon: generalSettings[index].icon,
                    title: generalSettings[index].title),
              );
            } else {
              return AccountSettingsTile(
                  icon: generalSettings[index].icon,
                  title: generalSettings[index].title);
            }
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 16.h,
            );
          },
          itemCount: generalSettings.length),
    );
  }
}
