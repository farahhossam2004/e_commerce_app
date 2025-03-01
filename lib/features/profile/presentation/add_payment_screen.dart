import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/payment_method_container.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/add_payment_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPaymentScreen extends StatelessWidget {
  const AddPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
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
                  side: BorderSide(color: const Color(0xFFEAEAEA), width: 1.w),
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
          'Payment Method',
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            PaymentMethodContainer(
              iconUrl: 'assets/images/mastercard.png',
              title: 'MasterCard',
              subtitle: '**** **** 0783 7873',
            ),
            SizedBox(height: 20.h),
            PaymentMethodContainer(
              iconUrl: 'assets/images/paypal.png',
              title: 'Paypal',
              subtitle: '**** **** 0783 7873',
            ),
            SizedBox(height: 20.h),
            PaymentMethodContainer(
              iconUrl: 'assets/images/applepay.png',
              title: 'Apple Pay',
              subtitle: '**** **** 0783 7873',
            ),
            Spacer(),
            CustomButton(
                label: 'Add New Payment',
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return AddNewPaymentModalSheet();
                      });
                })
          ],
        ),
      ),
    );
  }
}
