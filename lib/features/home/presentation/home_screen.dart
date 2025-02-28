import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/data/models/user_model.dart';
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
  final UserModel? userData;
  final List<ProductModel> products;
  const HomeScreen({super.key, this.userData, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: ScreenUtil().screenHeight,
            width: double.infinity,
            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.center,
            //         colors: [
            //       Color(0xFFFD9376),
            //       Color(0xFFFD8080),
            //       Color(0xFFFD788B),
            //       Color(0xFFFDB2B1),
            //       Color.fromARGB(255, 255, 255, 255),
            //       Color.fromARGB(255, 255, 255, 255),
            //     ])),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0, 0.5),
                            colors: [
                          Color(0xFFFD9376),
                          Color(0xFFFD9376),
                          Color(0xFFFD8080),
                          Color(0xFFFD788B),
                          Color(0xFFFDB2B1),
                          Color.fromARGB(255, 255, 255, 255),
                        ])),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          ConditionalBuilder(
                            condition:
                                userData != null,
                            builder: (BuildContext context) {
                              
                              return CustomTopBar(
                                streetName: userData!.address!.street!,
                                city: userData!.address!.city!,
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
                          // SizedBox(
                          //   height: 32.h,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Column(
                      children: [
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
                        ConditionalBuilder(
                          condition:
                             products.isNotEmpty,
                          builder: (context) {
                            return HoriztonalListOfProducts(
                                products: products);
                          },
                          fallback: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
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
                        ConditionalBuilder(
                          condition:
                              products.isNotEmpty,
                          builder: (context) {
                            return CategoriesGridView(
                                products: products);
                          },
                          fallback: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        
  }}