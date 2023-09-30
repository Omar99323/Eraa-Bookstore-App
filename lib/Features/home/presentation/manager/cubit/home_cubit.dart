import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_state.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/nav_pages/Favorites_body.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/nav_pages/books_body.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/nav_pages/cart_body.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/nav_pages/home_body.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/nav_pages/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  List<BookModel> listofBestSeller = [];
  String? token;
  int navindex = 0;
  List<String> slinderImgs = [];
  changeIndex(int index) {
    navindex = index;
    emit(HomeBottomNavBar());
  }

  List<Widget> screens() => [
        HomeBody(
          scaffoldkey: scaffoldkey,
          slinderImages: slinderImgs, bestSellerBooks: listofBestSeller,
        ),
        const BooksBody(),
        const FavoritesBody(),
        const CartBody(),
        const ProfileBody(),
      ];

  getSliders() async {
    slinderImgs.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.slidersEndpoint,
      token: token,
    ).then((value) {
      for (var element in value['data']['sliders']) {
        slinderImgs.add(element['image']);
      }
    });
    emit(HomeSlinder());
  }

  getBestSeller() async {
    listofBestSeller.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.bestSellersEndpoint,
      token: token,
    ).then((value) {
      for (var element in value['data']['products']) {
        listofBestSeller.add(BookModel.fromJson(element));
      }
    });
    emit(HomeBestSeller());
  }

  getNewArrival() async {
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.newArrivalsEndpoint,
      token: token,
    ).then((value) {});
  }

  getCategories() async {
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.categoriesEndpoint,
      token: token,
    ).then((value) {});
  }
}
