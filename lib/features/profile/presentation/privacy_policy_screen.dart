import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/privacy_policy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: 44.w,
                height: 44.h,
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side:
                        BorderSide(color: const Color(0xFFEAEAEA), width: 1.w),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textColor,
                  size: 20,
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Privacy Policy',
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              height: 1.44.h,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const privacyPolicyWidget(
                  title: '1. Types of Data We Collect',
                  subtitle:
                      'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                ),
                SizedBox(
                  height: 24.h,
                ),
                const privacyPolicyWidget(
                  title: '2. Use of Your Personal Datat',
                  subtitle:
                      """Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
            
            The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.""",
                ),
                SizedBox(
                  height: 24.h,
                ),
                const privacyPolicyWidget(
                  title: '3. Disclosure of Your Personal Data',
                  subtitle:
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                ),
              ],
            ),
          ),
        ));
  }
}
