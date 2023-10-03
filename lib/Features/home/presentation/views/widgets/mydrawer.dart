import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/data/models/user_model.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:book_store_eraa/Features/order_history/presentation/views/order_history.dart';
import 'package:book_store_eraa/Features/update_profile/presentation/views/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primaryswatch,
            ),
            currentAccountPicture: CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage(userModel.image!),
            ),
            accountName: SizedBox(
              width: 200.w,
              child: Text(
                userModel.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textStyle24w400.copyWith(
                  color: AppColors.colorWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ),
            accountEmail: SizedBox(
              width: 200.w,
              child: Text(
                userModel.email!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textStyle24w400.copyWith(
                  color: AppColors.colorWhite,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderHistory.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.history_edu,
                          size: 30,
                          color: AppColors.colorBlack.withOpacity(0.5),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          'Order History',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorBlack.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                    thickness: 2, color: AppColors.colorBlack.withOpacity(0.3)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, UpdateProfile.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 30,
                          color: AppColors.colorBlack.withOpacity(0.5),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          'Edit Profile',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorBlack.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                    thickness: 2, color: AppColors.colorBlack.withOpacity(0.3)),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.change_circle_outlined,
                          size: 30,
                          color: AppColors.colorBlack.withOpacity(0.5),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          'Change Password',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorBlack.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                    thickness: 2, color: AppColors.colorBlack.withOpacity(0.3)),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<HomeCubit>(context).logout();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout,
                          size: 30,
                          color: Colors.red,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          'LogOut',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorBlack.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
