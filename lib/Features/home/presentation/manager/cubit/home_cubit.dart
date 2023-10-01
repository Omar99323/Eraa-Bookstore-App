// ignore_for_file: missing_required_param
import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/data/models/category_model.dart';
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
  List<BookModel> listofNewArrival = [];
  List<String> slinderImgs = [];
  List<CategoryModel> listofCategories = [];
  String? username;
  String? useremail;
  String? usercity;
  String? userphone;
  String? useraddress;
  String? userimage;
  String? token;
  int navindex = 0;

  changeIndex(int index) {
    navindex = index;
    emit(HomeBottomNavBar());
  }

  logout() async {
    token = await SecureStorage.getData(key: 'token');
    await Api.post(
      url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
      token: token,
    ).then((value) {
      SecureStorage.deleteData(key: 'token');
      SecureStorage.deleteData(key: 'username');
      SecureStorage.deleteData(key: 'useremail');
      SecureStorage.deleteData(key: 'userimage');
      emit(HomeLogout());
    });
  }

  getUserModel({
    String? name,
    String? image,
    String? phone,
    String? city,
    String? address,
    String? emai,
  }) {
    username = name;
    userimage = image;
    userphone = phone;
    useremail = emai;
    useraddress = address;
    usercity = city;
    emit(HomeUserModel());
  }

  List<Widget> screens() => [
        HomeBody(
          scaffoldkey: scaffoldkey,
          slinderImages: slinderImgs,
          bestSellerBooks: listofBestSeller,
          newArrivalBooks: listofNewArrival,
          categories: listofCategories,
          username: username!,
          userimage: userimage!,
        ),
        const BooksBody(),
        const FavoritesBody(),
        const CartBody(),
        ProfileBody(
          username: username!,
          useremail: useremail!,
          userimage: userimage!,
          usercity: usercity,
          userphone: userphone,
          useraddress: useraddress,
        ),
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
    listofNewArrival.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.newArrivalsEndpoint,
      token: token,
    ).then((value) {
      for (var element in value['data']['products']) {
        listofNewArrival.add(BookModel.fromJson(element));
      }
      emit(HomeNewArrival());
    });
  }

  getCategories() async {
    listofCategories.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.categoriesEndpoint,
      token: token,
    ).then((value) {
      for (var element in value['data']['categories']) {
        listofCategories.add(CategoryModel.fromJson(element));
      }
      emit(HomeCategories());
    });
  }
}
