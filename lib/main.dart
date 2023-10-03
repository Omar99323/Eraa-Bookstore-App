import 'package:book_store_eraa/Core/helpers/observer.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:book_store_eraa/Features/OnBoarding/presentation/views/second_on_boarding_screen.dart';
import 'package:book_store_eraa/Features/Splash/presentation/views/splash_screen.dart';
import 'package:book_store_eraa/Features/book_details/presentation/manager/cubit/book_details_cubit.dart';
import 'package:book_store_eraa/Features/book_details/presentation/views/book_details.dart';
import 'package:book_store_eraa/Features/checkout/presentation/manager/cubit/check_out_cubit.dart';
import 'package:book_store_eraa/Features/checkout/presentation/views/checkout.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:book_store_eraa/Features/home/presentation/views/home_page.dart';
import 'package:book_store_eraa/Features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:book_store_eraa/Features/login/presentation/views/login_screen.dart';
import 'package:book_store_eraa/Features/order_history/presentation/manager/cubit/order_history_cubit.dart';
import 'package:book_store_eraa/Features/order_history/presentation/views/order_history.dart';
import 'package:book_store_eraa/Features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:book_store_eraa/Features/register/presentation/views/register_screen.dart';
import 'package:book_store_eraa/Features/update_profile/presentation/manager/cubit/update_profile_cubit.dart';
import 'package:book_store_eraa/Features/update_profile/presentation/views/update_profile.dart';
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
          create: (context) => HomeCubit()
            ..getSliders()
            ..getBestSeller()
            ..getNewArrival()
            ..getCategories()
            ..getUserModel()
            ..getAllBooks()
            ..wishListBooks()
            ..cartbooks(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateProfileCubit(),
        ),
        BlocProvider(
          create: (context) => BookDetailsCubit(),
        ),
        BlocProvider(
          create: (context) => OrderHistoryCubit()..orderHistory(),
        ),
        BlocProvider(
          create: (context) => CheckOutCubit()
            ..checkout()
            ..getCities(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryswatch,
          // useMaterial3: true,
        ),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          FirstOnBoardingScreen.id: (context) => const FirstOnBoardingScreen(),
          SecondOnBoardingScreen.id: (context) =>
              const SecondOnBoardingScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          HomePage.id: (context) => const HomePage(),
          UpdateProfile.id: (context) => const UpdateProfile(),
          BookDetails.id: (context) => const BookDetails(),
          CheckOut.id: (context) => const CheckOut(),
          OrderHistory.id: (context) => const OrderHistory(),
        },
      ),
    );
  }
}
