import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_products_gridview.dart';
import 'package:e_commerce_app/features/wishlist/logic/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (context) => WishlistCubit()..getProductsWishlist(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Wishlist',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.25.h,
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              BlocConsumer<WishlistCubit, WishlistState>(
                listener: (context, state) {
                   if (state is WishlistUpdated) {
      context.read<WishlistCubit>().getProductsWishlist();
    }
                },
                builder: (context, state) {
                  if (state is WishListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is WishListLoaded && context.read<WishlistCubit>().products.isNotEmpty) {
                    return CategoriesGridView(
                        products: context.read<WishlistCubit>().products);
                  }
                  if (state is WishListLoaded && context.read<WishlistCubit>().products.isEmpty) {
                    return const Center(child: Text('No products available'));
                  }
                  if (state is WishlistError) {
                    return Text(state.message);
                  }
                  return const Text('error');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
