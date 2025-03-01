import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  String cardName = 'Bryan Adam';
  String cardNumber = '2727  8907  1278  3726';
  String expiryDate = '10 / 26';
  @override
  void initState() {
    super.initState();

    cardNameController.addListener(() {
      setState(() {
        cardName = cardNameController.text.isEmpty
            ? 'Bryan Adam'
            : cardNameController.text;
      });
    });

    cardNumberController.addListener(() {
      setState(() {
        cardNumber = cardNumberController.text.isEmpty
            ? '2727  8907  1278  3726'
            : cardNumberController.text;
      });
    });

    expiryDateController.addListener(() {
      setState(() {
        expiryDate = expiryDateController.text.isEmpty
            ? '10 / 26'
            : expiryDateController.text;
      });
    });
  }

  @override
  void dispose() {
    cardNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xFF293547),
          ),
          Positioned(
              top: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 20.w),
                        width: 40.w,
                        height: 40.h,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(
                                color: const Color(0xFFEAEAEA), width: 0.2.w),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.backgroundColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    'Add New Card',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.backgroundColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.44.h,
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 0,
              child: Container(
                width: 375.w,
                height: 560.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  shadows: [
                    const BoxShadow(
                      color: Color(0x11576F85),
                      blurRadius: 32,
                      offset: Offset(0, -20),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 160.h),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextInput(
                          hintText: cardName,
                          labelText: 'Card Name',
                          controller: cardNameController),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextInput(
                          hintText: cardNumber,
                          labelText: 'Card Number',
                          controller: cardNumberController),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomTextInput(
                                hintText: expiryDate,
                                labelText: 'Expiry Date',
                                controller: expiryDateController),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomTextInput(
                                hintText: 'Add cvv',
                                labelText: 'CVV',
                                controller: cvvController),
                          )
                        ],
                      ),
                      Spacer(),
                      CustomButton(
                        label: 'Add Payment',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 24.h,
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
            top: 100.h,
            left: 22.w,
            child: Stack(children: [
              Container(
                width: 335.w,
                height: 215.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Rectangle.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 30.h,
                left: 20.w,
                child: Text(
                  'So Card',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.44.h,
                  ),
                ),
              ),
              Positioned(
                top: 90.h,
                left: 20.w,
                child: Text(
                  cardNumber,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.44.h,
                  ),
                ),
              ),
              Positioned(
                bottom: 50.h,
                left: 20.w,
                child: Text(
                  'Card holder name',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.40.h,
                  ),
                ),
              ),
              Positioned(
                bottom: 30.h,
                left: 20.w,
                child: Text(
                  cardName,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.14.h,
                  ),
                ),
              ),
              Positioned(
                bottom: 50.h,
                left: 150.w,
                child: Text(
                  'Expiry date',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.40.h,
                  ),
                ),
              ),
              Positioned(
                bottom: 30.h,
                left: 150.w,
                child: Text(
                  expiryDate,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.14.h,
                  ),
                ),
              ),
              Positioned(
                bottom: 20.h,
                right: 20.w,
                child: Image.asset('assets/images/brand.png'),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
