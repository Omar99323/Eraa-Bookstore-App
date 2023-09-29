import 'package:book_store_eraa/Core/helpers/observer.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:book_store_eraa/Features/OnBoarding/presentation/views/second_on_boarding_screen.dart';
import 'package:book_store_eraa/Features/Splash/presentation/views/splash_screen.dart';
import 'package:book_store_eraa/Features/home/presentation/views/home_page.dart';
import 'package:book_store_eraa/Features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:book_store_eraa/Features/login/presentation/views/login_screen.dart';
import 'package:book_store_eraa/Features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:book_store_eraa/Features/register/presentation/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SecureStorage.init();
  Bloc.observer = Observer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryswatch,
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          FirstOnBoardingScreen.id: (context) => const FirstOnBoardingScreen(),
          SecondOnBoardingScreen.id: (context) => const SecondOnBoardingScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          HomePage.id: (context) => const HomePage(),
        },
      ),
    );
  }
}
