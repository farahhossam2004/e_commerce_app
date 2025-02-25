import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/logic/cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_products_gridview.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_top_row.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/list_view_products.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/offer_container.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/time_count_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCurrentUserData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            height: ScreenUtil().screenHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.center,
                    colors: [
                  Color(0xFFFD9376),
                  Color(0xFFFD8080),
                  Color(0xFFFD788B),
                  Color(0xFFFDB2B1),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ])),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    ConditionalBuilder(
                      condition: context.watch<HomeCubit>().userData != null,
                      builder: (BuildContext context) {
                        var user = context.watch<HomeCubit>().userData;
                        return CustomTopBar(
                          streetName: user!.address!.street!,
                          city: user!.address!.city!,
                        );
                      },
                      fallback: (BuildContext context) {
                        return const CustomTopBar(
                            city: '', streetName: 'No Loaction Provided');
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Find best device for your setup!',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.12.h,
                      ),
                    ),
                    const OfferContainer(),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hot deals🔥',
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.44.h,
                          ),
                        ),
                        const TimeLeftWidget()
                      ],
                    ),
                    SizedBox(height: 12.h),
                    const HoriztonalListOfProducts(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Categories',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.44.h,
                      ),
                    ),
                    const CategoriesGridView()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
