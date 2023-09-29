import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/login/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  static const id = 'SecondOnBoardingScreen';

  const SecondOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          SecureStorage.writeData(key: 'firsttime', value: 'false');
          Navigator.of(context).pushReplacementNamed(LoginScreen.id);
        },
        child: Ink(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryswatch,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 50,
            width: 50,
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
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/3px4xsi8.png"),
            ),
            Text(
              'The best categories in your cart',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle34w900.copyWith(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
