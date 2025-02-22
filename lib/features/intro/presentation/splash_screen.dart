import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:e_commerce_app/features/intro/presentation/on_boarding1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: Duration(seconds: 5),
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 72.h,
            width: 200.w,
            child: SvgPicture.asset('assets/images/Icon.svg'),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            height: 29.h,
            width: 124.w,
            child: SvgPicture.asset('assets/images/zalada.svg'),
          )
        ],
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: const OnBoarding1(),
    );
  }
}
