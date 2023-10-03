// ignore_for_file: use_build_context_synchronously
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:book_store_eraa/Features/home/presentation/views/home_page.dart';
import 'package:book_store_eraa/Features/login/presentation/views/login_screen.dart';
import 'package:book_store_eraa/Features/otp/presentation/views/otp.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 1,
        ), () async {
      String? token = await SecureStorage.getData(key: 'token');
      String? firsttime = await SecureStorage.getData(key: 'firsttime');
      String? otp = await SecureStorage.getData(key: 'otp');

      if (firsttime == null) {
        Navigator.of(context).pushReplacementNamed(FirstOnBoardingScreen.id);
      } else {
        if (token == null) {
          Navigator.of(context).pushReplacementNamed(LoginScreen.id);
        } else {
          if (otp == null) {
            Navigator.of(context).pushReplacementNamed(OTPScreen.id);
          } else {
            Navigator.of(context).pushReplacementNamed(HomePage.id);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/unnamed.png",
          width: 200,
          height: 210,
        ),
      ),
    );
  }
}
