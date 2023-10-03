import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/OnBoarding/presentation/views/second_on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  static const id = 'FirstOnBoardingScreen';

  const FirstOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(SecondOnBoardingScreen.id);
        },
        child: Ink(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryswatch,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 50.h,
            width: 50.w,
            child: const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:  EdgeInsets.all(20.r),
              child: Image.asset("assets/565.jpg"),
            ),
            Text(
              'All you want in your reach',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle34w900.copyWith(
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
