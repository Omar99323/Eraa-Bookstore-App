// ignore_for_file: missing_required_param
import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/login/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  LoginUserModel? userModel;

  Icon visabl = const Icon(
    Icons.visibility,
    color: AppColors.primaryswatch,
  );
  Icon convisabl = const Icon(
    Icons.visibility,
    color: AppColors.primaryswatch,
  );
  bool obscure = true;
  bool conobscure = true;

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

  changeConVisability() {
    if (conobscure) {
      conobscure = !conobscure;
      convisabl = const Icon(
        Icons.visibility_off,
        color: AppColors.primaryswatch,
      );
    } else {
      conobscure = !conobscure;
      convisabl = const Icon(
        Icons.visibility,
        color: AppColors.primaryswatch,
      );
    }
    emit(ChangeVisability());
  }

  register({
    required String name,
    required String email,
    required String password,
    required String conpassword,
  }) async {
    emit(RegisterLoading());
    await Api.post(
      url: EndPoints.baseUrl + EndPoints.registerEndpoint,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': conpassword,
      },
    ).then((value) {
      if (value == 422) {
        emit(RegisterFailure(errmsg: 'The email has already been taken.'));
      } else {
        userModel = LoginUserModel.fromJson(value['data']);
        SecureStorage.writeData(key: 'username', value: userModel!.user!.name);
        SecureStorage.writeData(key: 'useremail', value: userModel!.user!.email);
        SecureStorage.writeData(key: 'userimage', value: userModel!.user!.image);
        SecureStorage.writeData(key: 'token', value: userModel!.token);
        emit(RegisterSuccess());
      }
    });
  }
}
