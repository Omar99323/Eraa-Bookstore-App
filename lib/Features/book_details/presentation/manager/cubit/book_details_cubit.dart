import 'package:book_store_eraa/Core/helpers/api.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/endpoints.dart';
import 'package:book_store_eraa/Features/book_details/presentation/manager/cubit/book_details_state.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitial());
  String? token;
  BookModel? bookModel;

  getBookDetails({required String bookId}) async {
    emit(BookDetailsLoading());
    token = await SecureStorage.getData(key: 'token');
    await Api.get(
      url: EndPoints.baseUrl + EndPoints.bookDetailsEndpoint + bookId,
      token: token,
    ).then((value) {
      bookModel = BookModel.fromJson(value["data"]);
    });
    emit(GetBookDetails());
  }
}
