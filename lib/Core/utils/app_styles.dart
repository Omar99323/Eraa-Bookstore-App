import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static  TextStyle textStyle24w400 = GoogleFonts.lato(
    color: AppColors.colorBlack,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle textStyle34w900 =GoogleFonts.lato(
    color: AppColors.primaryswatch,
    fontSize: 34.sp,
    fontWeight: FontWeight.w900,
  );
}
