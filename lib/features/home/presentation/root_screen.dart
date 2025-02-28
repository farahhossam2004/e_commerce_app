import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/browse/presentation/browse_screen.dart';
import 'package:e_commerce_app/features/cart/presentation/cart_screen.dart';
import 'package:e_commerce_app/features/home/logic/cubit/bottom_navigator_bar_cubit.dart';
import 'package:e_commerce_app/features/home/logic/cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/home_screen.dart';
import 'package:e_commerce_app/features/profile/presentation/profile_screen.dart';
import 'package:e_commerce_app/features/wishlist/presentation/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getCurrentUserData()
        ..getProducts(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            int selectedIndex =
                (state is BottomNavBarChanges) ? state.index : 0;
            return StylishBottomBar(
              currentIndex: selectedIndex,
              items: [
                BottomBarItem(
                  icon: const Icon(
                    Icons.house_outlined,
                  ),
                  selectedColor: AppColors.buttonColor,
                  unSelectedColor: AppColors.secondryTextColor,
                  title: Text(
                    'Home',
                    style: GoogleFonts.plusJakartaSans(
                      color: selectedIndex == 0
                          ? AppColors.buttonColor
                          : AppColors.secondryTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                BottomBarItem(
                  icon: const Icon(
                    Icons.search_rounded,
                  ),
                  selectedColor: AppColors.buttonColor,
                  unSelectedColor: AppColors.secondryTextColor,
                  title: Text(
                    'Browse',
                    style: GoogleFonts.plusJakartaSans(
                      color: selectedIndex == 1
                          ? AppColors.buttonColor
                          : AppColors.secondryTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                BottomBarItem(
                  icon: const Icon(
                    Icons.favorite_border_sharp,
                  ),
                  selectedColor: AppColors.buttonColor,
                  unSelectedColor: AppColors.secondryTextColor,
                  title: Text(
                    'Wishlist',
                    style: GoogleFonts.plusJakartaSans(
                      color: selectedIndex == 2
                          ? AppColors.buttonColor
                          : AppColors.secondryTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                BottomBarItem(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                  selectedColor: AppColors.buttonColor,
                  unSelectedColor: AppColors.secondryTextColor,
                  title: Text(
                    'Cart',
                    style: GoogleFonts.plusJakartaSans(
                      color: selectedIndex == 3
                          ? AppColors.buttonColor
                          : AppColors.secondryTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                BottomBarItem(
                  icon: const Icon(
                    Icons.person_2_outlined,
                  ),
                  selectedColor: AppColors.buttonColor,
                  unSelectedColor: AppColors.secondryTextColor,
                  title: Text(
                    'Profile',
                    style: GoogleFonts.plusJakartaSans(
                      color: selectedIndex == 4
                          ? AppColors.buttonColor
                          : AppColors.secondryTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
              option: AnimatedBarOptions(iconSize: 24.sp),
              onTap: (index) {
                switch (index) {
                  case 0:
                    BlocProvider.of<HomeCubit>(context).getNavBarItem('Home');
                    break;
                  case 1:
                    BlocProvider.of<HomeCubit>(context).getNavBarItem('Browse');
                    break;
                  case 2:
                    BlocProvider.of<HomeCubit>(context)
                        .getNavBarItem('Wishlist');
                    break;
                  case 3:
                    BlocProvider.of<HomeCubit>(context).getNavBarItem('Cart');
                    break;
                  case 4:
                    BlocProvider.of<HomeCubit>(context)
                        .getNavBarItem('Profile');
                    break;
                }
              },
            );
          },
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeUserLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is BottomNavBarChanges) {
              switch (state.index) {
                case 0:
                  return HomeScreen(
                    products: context.read<HomeCubit>().products,
                    userData: context.read<HomeCubit>().userData!,
                  );

                case 1:
                  return BrowseScreen();

                case 2:
                  return WishlistScreen();

                case 3:
                  return CartScreen();

                case 4:
                  return const ProfileScreen();
              }
            }
            return HomeScreen(
              products: context.read<HomeCubit>().products,
              userData: context.read<HomeCubit>().userData,
            );
          },
          listener: (BuildContext context, HomeState state) {},
        ),
      ),
    );
  }
}
