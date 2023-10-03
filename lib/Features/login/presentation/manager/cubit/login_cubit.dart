// ignore_for_file: missing_required_param
import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/login/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_store_eraa/Features/login/presentation/manager/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  LoginUserModel? userModel;

  Icon visabl = const Icon(
    Icons.visibility,
    color: AppColors.primaryswatch,
  );
  bool obscure = true;

  changeVisability() {
    if (obscure) {
      obscure = !obscure;
      visabl = const Icon(
        Icons.visibility_off,
        color: AppColors.primaryswatch,
      );
    } else {
      obscure = !obscure;
      visabl = const Icon(
        Icons.visibility,
        color: AppColors.primaryswatch,
      );
    }
    emit(ChangeVisability());
  }

  login({required String email, required String password}) async {
    emit(LoginLoading());
    await Api.post(
      url: EndPoints.baseUrl + EndPoints.loginEndpoint,
      body: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      if (value == 422) {
        emit(LoginFailure(errmsg: 'Invalid email or password.'));
      } else {
        userModel = LoginUserModel.fromJson(value['data']);
        SecureStorage.writeData(key: 'token', value: userModel!.token);
        if (userModel!.user!.emailVerified == true) {
          emit(LoginSuccess(page: 'home'));
        } else {
          emit(LoginSuccess(page: 'otp'));
        }
      }
    });
  }
}
