import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/browse/logic/cubit/search_cubit.dart';
import 'package:e_commerce_app/features/browse/presentation/search_result_screen.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_products_gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return BlocProvider(
      create: (context) => SearchCubit()..getProducts(), 
      child: Builder(
        builder: (BuildContext innerContext) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search laptop, headset..',
                          hintStyle: GoogleFonts.plusJakartaSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.50.h,
                              color: AppColors.secondryTextColor),
                          prefixIcon: const Icon(
                            CupertinoIcons.search,
                            color: AppColors.textColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(34.r),
                            borderSide: const BorderSide(
                                width: 1,
                                color: AppColors.bordetTextInputColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(34.r),
                            borderSide: const BorderSide(
                                width: 1,
                                color: AppColors.bordetTextInputColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(34.r),
                            borderSide: const BorderSide(
                                width: 1,
                                color: AppColors.bordetTextInputColor),
                          ),
                        ),
                        onSubmitted: (query) {
                          if (query.isNotEmpty) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SearchResultScreen(
                                query: query,
                              );
                            }));
                          }
                        },
                        onChanged: (query) {
                          if (query.isNotEmpty) {
                            innerContext
                                .read<SearchCubit>()
                                .searchProducts(query);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is SearchLoaded &&
                            state.searchedProducts.isEmpty) {
                          return Center(
                            child: Text(
                              'No products found',
                              style: GoogleFonts.plusJakartaSans(
                                  color: AppColors.secondryTextColor,
                                  fontSize: 18.sp),
                            ),
                          );
                        }
                        if (state is SearchLoaded) {
                          return Column(
                            children: [
                              // SizedBox(
                              //   height: 16.h,
                              // ),

                              SizedBox(
                                height: 24.h,
                              ),
                              CategoriesGridView(
                                products: state.searchedProducts,
                              ),
                            ],
                          );
                        }
                        if (state is SearchLoaded) {
                          return CategoriesGridView(
                            products: context.read<SearchCubit>().products,
                          );
                        }
                        return Container();
                      },
                    ),
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
