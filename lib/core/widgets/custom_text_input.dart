import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextInput(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _obscureTextNotifier = ValueNotifier<bool>(true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.plusJakartaSans(
              fontSize: 12.sp,
              color: AppColors.secondryTextColor,
              fontWeight: FontWeight.w600,
              height: 1.33.h),
        ),
        SizedBox(
          height: 8.h,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _obscureTextNotifier,
          builder: (context, obscureText, child) {
            return Container(
              height: 56.h,
              child: TextField(
                controller: controller,
                obscureText: isPassword ? obscureText : false,
                decoration: InputDecoration(
                  suffixIcon: isPassword
                      ? IconButton(
                          onPressed: () {
                            _obscureTextNotifier.value = !obscureText;
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off,
                          ),
                        )
                      : null,
                  hintText: hintText,
                  hintStyle: GoogleFonts.plusJakartaSans(
                      fontSize: 16.sp,
                      color: AppColors.secondryTextColor,
                      fontWeight: FontWeight.w400,
                      height: 1.50.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.bordetTextInputColor,
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.bordetTextInputColor,
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: AppColors.bordetTextInputColor,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
