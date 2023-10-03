import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/otp/presentation/manager/cubit/otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  String? token;

  verifyEmail({required String? code}) async {
    emit(OtpLoading());
    token = SecureStorage.getData(key: 'token');
    await Api.post(
      url: EndPoints.baseUrl + EndPoints.verifyEmailEndpoint,
      body: {
        "verify_code": code??'000000',
      },
      token: token,
    ).then((value) {
      if (value == 422) {
        emit(OtpFailure(errmsg: 'Invalid Code'));
      } else {
        SecureStorage.writeData(key: 'otp', value: 'done');
        emit(OtpSuccess());
      }
    });
  }

  resend() async {
    token = SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.resendVerifyEmailEndpoint,
      token: token,
    );
    emit(OtpResend());
  }
}
