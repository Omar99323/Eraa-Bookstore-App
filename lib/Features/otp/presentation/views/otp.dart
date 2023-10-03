import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/presentation/views/home_page.dart';
import 'package:book_store_eraa/Features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:book_store_eraa/Features/otp/presentation/manager/cubit/otp_cubit.dart';
import 'package:book_store_eraa/Features/otp/presentation/manager/cubit/otp_state.dart';
import 'package:book_store_eraa/Features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  static const id = 'OTPScreen';

  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? code;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpFailure) {
          AnimatedSnackBar.material(state.errmsg,
              type: AnimatedSnackBarType.error);
        }
        if (state is OtpSuccess) {
          AnimatedSnackBar.material("Email verified successfully",
              type: AnimatedSnackBarType.success);
          Navigator.pushReplacementNamed(context, HomePage.id);
        }
        if (state is OtpResend) {
          AnimatedSnackBar.material("Check your email now!",
              type: AnimatedSnackBarType.success);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 100.h),
            child: state is OtpLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verify your email',
                        style: AppStyles.textStyle24w400.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 28.sp,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        'Enter your 6 digit code numbers sent to ${BlocProvider.of<RegisterCubit>(context).userModel?.user?.email ?? BlocProvider.of<LoginCubit>(context).userModel?.user?.email}',
                        style: AppStyles.textStyle24w400.copyWith(
                          color: AppColors.colorBlack.withOpacity(0.5),
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceBetween,
                        fieldWidth: 45,
                        otpFieldStyle: OtpFieldStyle(
                          focusBorderColor: AppColors.primaryswatch,
                          enabledBorderColor: AppColors.primaryswatch,
                          borderColor: AppColors.primaryswatch,
                        ),
                        fieldStyle: FieldStyle.box,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                        onChanged: (value) {
                          code = value;
                        },
                      ),
                      SizedBox(height: 30.h),
                      GestureDetector(
                        onTap: () =>
                            BlocProvider.of<OtpCubit>(context).resend(),
                        child: Text(
                          'Resend Code',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 14.sp,
                            color: AppColors.primaryswatch,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryswatch,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          onPressed: () {
                            BlocProvider.of<OtpCubit>(context)
                                .verifyEmail(code: code);
                          },
                          child: Text(
                            "Confirm",
                            textAlign: TextAlign.center,
                            style: AppStyles.textStyle24w400.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.colorWhite,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
