import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/order_history/data/model/order_model.dart';
import 'package:book_store_eraa/Features/order_history/presentation/manager/cubit/order_history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());
  List<OrderModel> orders = [];
  String? token;

  orderHistory() async {
    orders.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.orderHistoryEndpoint,
      token: token,
    ).then((value) {
      for (var element in value['data']['orders']) {
        orders.add(OrderModel.fromJson(element));
      }
    });
    emit(OrderHistory());
  }
}
