// ignore_for_file: body_might_complete_normally_nullable

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/presentation/views/home_page.dart';
import 'package:book_store_eraa/Features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:book_store_eraa/Features/login/presentation/manager/cubit/login_state.dart';
import 'package:book_store_eraa/Features/register/presentation/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          AnimatedSnackBar.material(
            'Loggedin successfully',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              bottomOnAppearance: 100,
            ),
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
          Navigator.pushReplacementNamed(context, HomePage.id);
        }
        if (state is LoginFailure) {
          AnimatedSnackBar.material(
            state.errmsg,
            type: AnimatedSnackBarType.error,
            mobilePositionSettings: const MobilePositionSettings(
              bottomOnAppearance: 100,
            ),
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
        }
      },
      builder: (context, state) {
        var loginCubit = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 55,
                ),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 120,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/unnamed.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Login now!",
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle34w900,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: AppStyles.textStyle24w400.copyWith(
                                fontSize: 14,
                                color: AppColors.colorBlack.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RegisterScreen.id);
                              },
                              child: Text(
                                'Register Now!',
                                style: AppStyles.textStyle34w900.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                              color: AppColors.primaryswatch,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 25,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: AppColors.primaryswatch,
                                    ),
                                    hintStyle:
                                        AppStyles.textStyle34w900.copyWith(
                                      fontSize: 16,
                                    ),
                                    hintText: "Email",
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: AppColors.primaryswatch,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryswatch,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email must not be empty';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  obscureText: loginCubit.obscure,
                                  controller: password,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          loginCubit.changeVisability();
                                        },
                                        child: loginCubit.visabl),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: AppColors.primaryswatch,
                                    ),
                                    hintStyle:
                                        AppStyles.textStyle34w900.copyWith(
                                      fontSize: 16,
                                    ),
                                    hintText: "Password",
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: AppColors.primaryswatch,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryswatch,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password must not be empty';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primaryswatch,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(26),
                                        )),
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        loginCubit.login(
                                          email: email.text,
                                          password: password.text,
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Login",
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
