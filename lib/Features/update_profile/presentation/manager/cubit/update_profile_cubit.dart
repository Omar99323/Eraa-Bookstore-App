import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/update_profile/presentation/manager/cubit/update_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  String? token;

  updateProfile({
    required String name,
    required String email,
    required String phone,
    required String city,
    required String address,
  }) async {
    emit(UpdateProfileLoading());
    token = await SecureStorage.getData(key: 'token');
    await Api.post(
      url: EndPoints.baseUrl + EndPoints.updateProfileEndpoint,
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'city': city,
        'address': address,
      },
      token: token,
    ).then((value) {
      emit(UpdateProfileSuccess());
    });
  }
}
