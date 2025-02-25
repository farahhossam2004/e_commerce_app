import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/browse/presentation/browse_screen.dart';
import 'package:e_commerce_app/features/home/logic/cubit/bottom_navigator_bar_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/home_screen.dart';
import 'package:e_commerce_app/features/profile/presentation/profile_screen.dart';
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
      create: (context) => BottomNavigatorBarCubit(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar:
            BlocBuilder<BottomNavigatorBarCubit, BottomNavigatorBarState>(
          builder: (context, state) {
            int selectedIndex =
                (state is BottomNavigatorBarChanges) ? state.index : 0;
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
                    BlocProvider.of<BottomNavigatorBarCubit>(context)
                        .getNavBarItem('Home');
                    break;
                  case 1:
                    BlocProvider.of<BottomNavigatorBarCubit>(context)
                        .getNavBarItem('Browse');
                    break;
                  case 2:
                    BlocProvider.of<BottomNavigatorBarCubit>(context)
                        .getNavBarItem('Wishlist');
                    break;
                  case 3:
                    BlocProvider.of<BottomNavigatorBarCubit>(context)
                        .getNavBarItem('Cart');
                    break;
                  case 4:
                    BlocProvider.of<BottomNavigatorBarCubit>(context)
                        .getNavBarItem('Profile');
                    break;
                }
              },
            );
          },
        ),
        body: BlocBuilder<BottomNavigatorBarCubit, BottomNavigatorBarState>(
            builder: (context, state) {
          if (state is BottomNavigatorBarChanges) {
            switch (state.item) {
              case 'Home':
                return const HomeScreen();

              case 'Browse':
                return  BrowseScreen();

              case 'Wishlist':
                return const Center(child: Text('Wishlist'));

              case 'Cart':
                return const Center(child: Text('Cart'));

              case 'Profile':
                return const ProfileScreen();
            }
          }
          return Container();
        }),
      ),
    );
  }
}
