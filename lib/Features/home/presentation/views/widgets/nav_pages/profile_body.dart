import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.username,
    required this.useremail,
    this.usercity,
    this.userphone,
    this.useraddress,
    required this.userimage,
  });

  final String username;
  final String useremail;
  final String userimage;
  final String? usercity;
  final String? userphone;
  final String? useraddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const SizedBox(
                  height: 330,
                  width: double.infinity,
                ),
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryswatch,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
                SafeArea(
                  child: Text(
                    'Profile',
                    style: AppStyles.textStyle34w900.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: AppColors.colorWhite,
                    ),
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 110,
              backgroundColor: AppColors.colorWhite,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: AppColors.primaryswatch,
                backgroundImage: NetworkImage(userimage),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.colorBlack.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    CustomFormField(
                      initvalue: username,
                      label: 'Name',
                      prefixicon: const Icon(
                        Icons.person,
                        color: AppColors.primaryswatch,
                      ),
                      enabled: false,
                    ),
                    const SizedBox(height: 20),
                    CustomFormField(
                      initvalue: useremail,
                      label: 'Email',
                      prefixicon: const Icon(
                        Icons.email,
                        color: AppColors.primaryswatch,
                      ),
                      enabled: false,
                    ),
                    const SizedBox(height: 20),
                    CustomFormField(
                      initvalue: userphone ?? 'null',
                      label: 'Phone',
                      prefixicon: const Icon(
                        Icons.phone,
                        color: AppColors.primaryswatch,
                      ),
                      enabled: false,
                    ),
                    const SizedBox(height: 20),
                    CustomFormField(
                      initvalue: usercity ?? 'null',
                      label: 'City',
                      prefixicon: const Icon(
                        Icons.location_city,
                        color: AppColors.primaryswatch,
                      ),
                      enabled: false,
                    ),
                    const SizedBox(height: 20),
                    CustomFormField(
                      initvalue: useraddress ?? 'null',
                      label: 'Address',
                      prefixicon: const Icon(
                        Icons.location_city,
                        color: AppColors.primaryswatch,
                      ),
                      enabled: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryswatch,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      )),
                  onPressed: () {},
                  child: Text(
                    "Edit Profle",
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 18,
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
    );
  }
}
