import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_input.dart';
import 'package:e_commerce_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/OTP_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/social_media_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthRegisterLoading) {
                showDialog(
                    context: context,
                    builder: (context) =>
                        const Center(child: CircularProgressIndicator()));
              }

              if (state is AuthRegisterSuccess) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Success Registeration"),
                ));
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return LoginScreen();
                // }));
              }

              if (state is AuthRegisterFailure) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
              }
            },
            builder: (context, state) {
              return SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        "Create your new \naccount",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.12.h,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      CustomTextInput(
                        hintText: 'Email address',
                        labelText: 'Email Address',
                        controller: userNameController,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextInput(
                        hintText: 'Password',
                        labelText: 'Password',
                        controller: passwordController,
                        isPassword: true,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextInput(
                        hintText: 'Password',
                        labelText: 'Confirm Password',
                        controller: confirmPasswordController,
                        isPassword: true,
                      ),
                      SizedBox(height: 24.h),
                      CustomButton(
                          label: 'Register',
                          onPressed: () {
                            context.read<AuthCubit>().register(
                                  userNameController.text,
                                  passwordController.text,
                                );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OTPScreen()));
                          }),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90.w,
                            height: 1.h,
                            color: AppColors.bordetTextInputColor,
                          ),
                          Text(
                            'or continue with ',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16.sp,
                              color: AppColors.secondryTextColor,
                              fontWeight: FontWeight.w500,
                              height: 1.50.h,
                            ),
                          ),
                          Container(
                            width: 90.w,
                            height: 1.h,
                            color: AppColors.bordetTextInputColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const SocialMediaLoginWidget(
                        iconPath: 'assets/images/google.svg',
                        text: 'Continue with google',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const SocialMediaLoginWidget(
                        iconPath: 'assets/images/facebook.svg',
                        text: 'Continue with facebook',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.50.h,
                                color: AppColors.secondryTextColor),
                          ),
                          Text(
                            'Register',
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.50.h,
                                color: AppColors.clickableTextColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
            },
          )),
    );
  }
}
