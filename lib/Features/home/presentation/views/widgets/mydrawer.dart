import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer(
      {super.key,
      required this.name,
      required this.email,
      required this.image});
  final String name;
  final String email;
  final String image;

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
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
            accountName: Text(
              name,
              style: AppStyles.textStyle24w400.copyWith(
                color: AppColors.colorWhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            accountEmail: Text(
              email,
              style: AppStyles.textStyle24w400.copyWith(
                color: AppColors.colorWhite,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.history_edu,
                        size: 30,
                        color: AppColors.colorBlack.withOpacity(0.5),
                      ),
                      const SizedBox(width: 15),
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
                const SizedBox(height: 20),
                Divider(
                    thickness: 2, color: AppColors.colorBlack.withOpacity(0.3)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 30,
                        color: AppColors.colorBlack.withOpacity(0.5),
                      ),
                      const SizedBox(width: 15),
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
                const SizedBox(height: 20),
                Divider(
                    thickness: 2, color: AppColors.colorBlack.withOpacity(0.3)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.change_circle_outlined,
                        size: 30,
                        color: AppColors.colorBlack.withOpacity(0.5),
                      ),
                      const SizedBox(width: 15),
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
                const SizedBox(height: 20),
                Divider(
                    thickness: 2, color: AppColors.colorBlack.withOpacity(0.3)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<HomeCubit>(context).logout();
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 15),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
