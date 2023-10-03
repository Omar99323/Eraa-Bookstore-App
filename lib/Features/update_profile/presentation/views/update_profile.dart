import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Core/widgets/custom_form_field.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:book_store_eraa/Features/update_profile/presentation/manager/cubit/update_profile_cubit.dart';
import 'package:book_store_eraa/Features/update_profile/presentation/manager/cubit/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});
  static const id = 'UpdateProfile';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UpdateProfileCubit? updateCubit;
  HomeCubit? homeCubit;
  String? email;
  String? name;
  String? image;
  String? phone;
  String? city;
  String? address;

  @override
  void initState() {
    super.initState();
    updateCubit = BlocProvider.of<UpdateProfileCubit>(context);
    homeCubit = BlocProvider.of<HomeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          AnimatedSnackBar.material(
            'Profile Updated Successfully',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              bottomOnAppearance: 100,
            ),
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
          Navigator.pop(context);
          homeCubit!.getUserModel();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is UpdateProfileLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                SizedBox(
                                  height: 230.h,
                                  width: double.infinity,
                                ),
                                Container(
                                  height: 140.h,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryswatch,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: AppColors.colorWhite,
                                          size: 40,
                                        ),
                                      ),
                                      SizedBox(width: 80.w),
                                      Text(
                                        'Profile',
                                        style:
                                            AppStyles.textStyle34w900.copyWith(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          color: AppColors.colorWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 85.r,
                              backgroundColor: AppColors.colorWhite,
                              child: CircleAvatar(
                                radius: 80.r,
                                backgroundColor: AppColors.primaryswatch,
                                backgroundImage:
                                    NetworkImage(homeCubit!.userModel!.image!),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 15.h),
                                decoration: BoxDecoration(
                                  color: AppColors.colorBlack.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    CustomFormField(
                                      initvalue: homeCubit!.userModel!.name,
                                      autofocus: true,
                                      label: 'Name',
                                      prefixicon: const Icon(
                                        Icons.person,
                                        color: AppColors.primaryswatch,
                                      ),
                                      onchange: (p0) {
                                        name = p0;
                                      },
                                    ),
                                    SizedBox(height: 15.h),
                                    CustomFormField(
                                      onchange: (p0) {
                                        email = p0;
                                      },
                                      inputType: TextInputType.emailAddress,
                                      initvalue: homeCubit!.userModel!.email,
                                      label: 'Email',
                                      prefixicon: const Icon(
                                        Icons.email,
                                        color: AppColors.primaryswatch,
                                      ),
                                    ),
                                    SizedBox(height: 15.h),
                                    CustomFormField(
                                      onchange: (p0) {
                                        phone = p0;
                                      },
                                      inputType: TextInputType.phone,
                                      initvalue:
                                          homeCubit?.userModel?.phone ?? 'null',
                                      label: 'Phone',
                                      prefixicon: const Icon(
                                        Icons.phone,
                                        color: AppColors.primaryswatch,
                                      ),
                                    ),
                                    SizedBox(height: 15.h),
                                    CustomFormField(
                                      onchange: (p0) {
                                        city = p0;
                                      },
                                      initvalue:
                                          homeCubit?.userModel?.city ?? 'null',
                                      label: 'City',
                                      prefixicon: const Icon(
                                        Icons.location_city,
                                        color: AppColors.primaryswatch,
                                      ),
                                    ),
                                    SizedBox(height: 15.h),
                                    CustomFormField(
                                      onchange: (p0) {
                                        address = p0;
                                      },
                                      initvalue:
                                          homeCubit?.userModel?.address ??
                                              'null',
                                      label: 'Address',
                                      prefixicon: const Icon(
                                        Icons.location_city,
                                        color: AppColors.primaryswatch,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(
                                height: 50.h,
                                width: double.infinity,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: AppColors.primaryswatch,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(26),
                                      )),
                                  onPressed: () {
                                    updateCubit!.updateProfile(
                                      name: name ?? homeCubit!.userModel!.name!,
                                      email:
                                          email ?? homeCubit!.userModel!.email!,
                                      phone: phone ??
                                          homeCubit!.userModel!.phone ??
                                          'null',
                                      city: city ??
                                          homeCubit!.userModel!.city ??
                                          'null',
                                      address: address ??
                                          homeCubit!.userModel!.address ??
                                          'null',
                                    );
                                  },
                                  child: Text(
                                    "Edit Profle",
                                    textAlign: TextAlign.center,
                                    style: AppStyles.textStyle24w400.copyWith(
                                      fontSize: 16.sp,
                                      color: AppColors.colorWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
