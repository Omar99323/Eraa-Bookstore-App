// ignore_for_file: body_might_complete_normally_nullable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/otp/presentation/views/otp.dart';
import 'package:book_store_eraa/Features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:book_store_eraa/Features/register/presentation/manager/cubit/register_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AnimatedSnackBar.material(
            'Successfully registered!, Please verify your email',
            type: AnimatedSnackBarType.success,
            mobilePositionSettings: const MobilePositionSettings(
              bottomOnAppearance: 100,
            ),
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
          ).show(context);
          Navigator.pushReplacementNamed(context, OTPScreen.id);
        }
        if (state is RegisterFailure) {
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
        var registerCubit = BlocProvider.of<RegisterCubit>(context);
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
                          "Join Us!",
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle34w900,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: [
                            Text(
                              'Already have an account?',
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
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Login!',
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
                                  controller: name,
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
                                    hintText: "Name",
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
                                      return 'Name must not be empty';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
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
                                    } else if (!value.contains('@gmail.com')) {
                                      return 'Enter valid email like (example@gmail.com).';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  obscureText: registerCubit.obscure,
                                  controller: password,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          registerCubit.changeVisability();
                                        },
                                        child: registerCubit.visabl),
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
                                    } else if (value.length <= 7) {
                                      return 'Password must not be less than 8 characters.';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  obscureText: registerCubit.conobscure,
                                  controller: confirmPassword,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          registerCubit.changeConVisability();
                                        },
                                        child: registerCubit.convisabl),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: AppColors.primaryswatch,
                                    ),
                                    hintStyle:
                                        AppStyles.textStyle34w900.copyWith(
                                      fontSize: 16,
                                    ),
                                    hintText: "Confirm Password",
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
                                    if (confirmPassword.text != password.text) {
                                      return 'Password must be the same';
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
                                        registerCubit.register(
                                          name: name.text,
                                          email: email.text,
                                          password: password.text,
                                          conpassword: confirmPassword.text,
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Register",
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
