import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/browse/logic/cubit/search_cubit.dart';
import 'package:e_commerce_app/features/browse/presentation/widgets/apply_filter_widget.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_products_gridview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;

  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController(text: query);
    String queryString = query;
    return BlocProvider(
      create: (context) => SearchCubit()..getProducts(searchQuery: query),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Builder(
                builder: (BuildContext innerContext) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFEAEAEA)),
                                  borderRadius: BorderRadius.circular(34),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                          Container(
                            width: 283.w,
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
                              onChanged: (query) {
                                queryString = query;
                                innerContext
                                    .read<SearchCubit>()
                                    .searchProducts(query);
                              },
                            ),
                          ),
                        ],
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
                            return Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Result for "${queryString}"',
                                        style: GoogleFonts.plusJakartaSans(
                                          color: AppColors.secondryTextColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.43.h,
                                        ),
                                      ),
                                      Text(
                                        '${state.searchedProducts.length} founds',
                                        style: GoogleFonts.plusJakartaSans(
                                          color: AppColors.priceTextColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.43.h,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  CategoriesGridView(
                                    products: state.searchedProducts,
                                  ),
                                ],
                              ),
                            );
                          }
                          return CategoriesGridView(
                            products: context.read<SearchCubit>().products,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          width: 119.w,
          height: 52.h,
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
                backgroundColor: AppColors.buttonColor,
                onPressed: () {
                  final searchCubit = context.read<SearchCubit>();
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BlocProvider.value(
                          value: searchCubit, // Pass the existing instance
                          child: ApplyFilterWidget(),
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.filter_alt_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Filter',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.50.h,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
