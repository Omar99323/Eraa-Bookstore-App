import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/checkout/data/models/checkout_model.dart';
import 'package:book_store_eraa/Features/checkout/data/models/city_model.dart';
import 'package:book_store_eraa/Features/checkout/presentation/manager/cubit/check_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());
  CheckoutModel? checkoutModel;
  List<CityModel> cityies = [];
  String? token;

  checkout() async {
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.checkoutEndpoint,
      token: token,
    ).then((value) {
      checkoutModel = CheckoutModel.fromJson(value['data']);
    });
    emit(CheckOut());
  }

  getCities() async {
    cityies.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.getCitiesEndpoint,
      token: token,
    ).then((value) {
      for (var element in value['data']) {
        cityies.add(CityModel.fromjson(element));
      }
    });
    emit(GetCities());
  }
}
