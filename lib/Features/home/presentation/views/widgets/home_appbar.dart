import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.scaffoldkey,
    required this.username,
    required this.userimage,
  });

  final GlobalKey<ScaffoldState> scaffoldkey;
  final String username;
  final String userimage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            scaffoldkey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu_rounded,
            size: 30,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${username.split(' ')[0]}',
              style: AppStyles.textStyle24w400.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            Text(
              'What are you reading today?',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 14.sp,
                color: AppColors.colorBlack.withOpacity(0.5),
              ),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primaryswatch,
          backgroundImage: NetworkImage(userimage),
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}
