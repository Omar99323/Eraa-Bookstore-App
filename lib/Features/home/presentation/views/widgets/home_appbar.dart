import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.scaffoldkey,
  });

  final GlobalKey<ScaffoldState> scaffoldkey;

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
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, user name',
              style: AppStyles.textStyle24w400.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'What are you reading today?',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 14,
                color: AppColors.colorBlack.withOpacity(0.5),
              ),
            ),
          ],
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primaryswatch,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}