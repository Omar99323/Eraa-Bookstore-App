// ignore_for_file: missing_required_param
import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/data/models/cart_model.dart';
import 'package:book_store_eraa/Features/home/data/models/category_model.dart';
import 'package:book_store_eraa/Features/home/data/models/user_model.dart';
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
  List<BookModel> allBooks = [];
  List<BookModel> searchBooks = [];
  List<BookModel> wishlistBooks = [];
  List<CartItems> cartBooks = [];
  List<String> slinderImgs = [];
  List<CategoryModel> listofCategories = [];
  UserModel? userModel;
  CartModel? cartModel;
  bool searching = false;
  String? token;
  int navindex = 0;

  searchin() {
    searching = true;
    emit(HomeSearching());
  }

  endSearchin() {
    searching = false;

    emit(HomeSearching());
  }

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
      emit(HomeLogout());
    });
  }

  addToWish({required String id}) async {
    token = await SecureStorage.getData(key: 'token');
    await Api.post(
        url: EndPoints.baseUrl + EndPoints.addTowishlistEndpoint,
        token: token,
        body: {
          'product_id': id,
        }).then((value) {
      emit(HomeAddToWishList());
      wishListBooks();
    });
  }

  addToCart({required String id}) async {
    token = await SecureStorage.getData(key: 'token');
    await Api.post(
        url: EndPoints.baseUrl + EndPoints.addToCartEndpoint,
        token: token,
        body: {
          'product_id': id,
        }).then((value) {});
    emit(HomeAddToCart());
  }

  removeFromCart({required String id}) async {
    token = await SecureStorage.getData(key: 'token');
    await Api.post(
        url: EndPoints.baseUrl + EndPoints.removeFromCartEndpoint,
        token: token,
        body: {
          'cart_item_id': id,
        }).then((value) {
      emit(HomeRemoveFromCart());
      Future.delayed(const Duration(milliseconds: 100), () {
        cartbooks();
      });
    });
  }

  updateCart({
    required String id,
    required String quantity,
  }) async {
    token = await SecureStorage.getData(key: 'token');
    await Api.post(
        url: EndPoints.baseUrl + EndPoints.updateCartEndpoint,
        token: token,
        body: {
          'cart_item_id': id,
          'quantity': quantity,
        }).then((value) {
      emit(HomeUpdateCart());
      Future.delayed(const Duration(milliseconds: 100), () {
        cartbooks();
      });
    });
  }

  removeFromWish({required String id}) async {
    token = await SecureStorage.getData(key: 'token');
    await Api.post(
        url: EndPoints.baseUrl + EndPoints.removeFromwishlistEndpoint,
        token: token,
        body: {
          'product_id': id,
        }).then((value) {
      emit(HomeRemoveFromWishList());
      Future.delayed(const Duration(milliseconds: 100), () {
        wishListBooks();
      });
    });
  }

  getUserModel() async {
    userModel == null;
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.userProfileEndpoint,
      token: token,
    ).then((value) {
      userModel = UserModel.fromJson(value['data']);
    });
    emit(HomeUserModel());
  }

  List<Widget> screens() => [
        HomeBody(
          scaffoldkey: scaffoldkey,
          slinderImages: slinderImgs,
          bestSellerBooks: listofBestSeller,
          newArrivalBooks: listofNewArrival,
          categories: listofCategories,
          userModel: userModel!,
        ),
        BooksBody(
          allBooks: allBooks,
          searchBooks: searchBooks,
          wishBooks: wishlistBooks,
          // wishids: wishids,
        ),
        FavoritesBody(
          wishlistBooks: wishlistBooks,
        ),
        CartBody(
          cartbooks: cartBooks,
          cartModel: cartModel!,
        ),
        ProfileBody(userModel: userModel!),
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
      emit(HomeSlinder());
    });
  }

  getAllBooks() async {
    allBooks.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.allBooksEndpoint,
      token: token,
    ).then((value) {
      for (var element in value['data']['products']) {
        allBooks.add(BookModel.fromJson(element));
      }
      emit(HomeAllBooks());
    });
  }

  cartbooks() async {
    cartBooks.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.cartEndpoint,
      token: token,
    ).then((value) {
      cartModel = CartModel.fromJson(value['data']);
      for (var element in value['data']['cart_items']) {
        cartBooks.add(CartItems.fromJson(element));
      }
      emit(HomeCartBooks());
    });
  }

  wishListBooks() async {
    wishlistBooks.clear();
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.wishlistEndpoint,
      token: token,
    ).then((value) {
      for (var element in value['data']['data']) {
        wishlistBooks.add(BookModel.fromJson(element));
      }
      emit(HomeWishListBooks());
    });
  }

  search({required String name}) async {
    searchBooks.clear();
    emit(HomeSearchLoading());
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.searchEndpoint + name,
      token: token,
    ).then((value) {
      for (var element in value['data']['products']) {
        searchBooks.add(BookModel.fromJson(element));
      }
      emit(HomeSearchSuccess());
    });
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
      emit(HomeBestSeller());
    });
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
