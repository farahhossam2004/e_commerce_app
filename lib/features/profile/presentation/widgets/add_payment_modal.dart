import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/payment_method_container.dart';
import 'package:e_commerce_app/features/profile/presentation/add_new_card_screen.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/add_payment_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewPaymentModalSheet extends StatelessWidget {
  const AddNewPaymentModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 438.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 4.h,
                width: 66.67.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: AppColors.bordetTextInputColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Add new payment method',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              AddPaymentTile(
                iconUrl: 'assets/images/card.png',
                title: 'Credit or Debit Card',
                subtitle: 'Pay with your Visa or Mastercard ',
                isSelected: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              AddPaymentTile(
                iconUrl: 'assets/images/paypal.png',
                title: 'Paypal',
              ),
              SizedBox(
                height: 16.h,
              ),
              AddPaymentTile(
                iconUrl: 'assets/images/applepay.png',
                title: 'Apple Pay',
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomButton(
                  label: 'Continue',
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNewCardScreen()));
                  }),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
