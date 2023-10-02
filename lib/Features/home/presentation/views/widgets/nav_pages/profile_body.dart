import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Core/widgets/custom_form_field.dart';
import 'package:book_store_eraa/Features/home/data/models/user_model.dart';
import 'package:book_store_eraa/Features/update_profile/presentation/views/update_profile.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
                    backgroundImage: NetworkImage(userModel.image!),
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
                          initvalue: userModel.name,
                          label: 'Name',
                          prefixicon: const Icon(
                            Icons.person,
                            color: AppColors.primaryswatch,
                          ),
                          disenabled: true,
                        ),
                        const SizedBox(height: 20),
                        CustomFormField(
                          initvalue: userModel.email,
                          label: 'Email',
                          prefixicon: const Icon(
                            Icons.email,
                            color: AppColors.primaryswatch,
                          ),
                          disenabled: true,
                        ),
                        const SizedBox(height: 20),
                        CustomFormField(
                          initvalue: userModel.phone ?? 'null',
                          label: 'Phone',
                          prefixicon: const Icon(
                            Icons.phone,
                            color: AppColors.primaryswatch,
                          ),
                          disenabled: true,
                        ),
                        const SizedBox(height: 20),
                        CustomFormField(
                          initvalue: userModel.city ?? 'null',
                          label: 'City',
                          prefixicon: const Icon(
                            Icons.location_city,
                            color: AppColors.primaryswatch,
                          ),
                          disenabled: true,
                        ),
                        const SizedBox(height: 20),
                        CustomFormField(
                          initvalue: userModel.address ?? 'null',
                          label: 'Address',
                          prefixicon: const Icon(
                            Icons.location_city,
                            color: AppColors.primaryswatch,
                          ),
                          disenabled: true,
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
                      onPressed: () {
                        Navigator.pushNamed(context, UpdateProfile.id);
                      },
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
        ),
      ),
    );
  }
}
