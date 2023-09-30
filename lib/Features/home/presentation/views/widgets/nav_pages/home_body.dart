import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/data/models/category_model.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/bannars_section.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/best_seller_section.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/categories_section.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/home_appbar.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/new_arrivals.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/slider_section.dart';
import 'package:book_store_eraa/Features/login/data/models/login_model.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.scaffoldkey,
    required this.slinderImages,
    required this.bestSellerBooks,
    required this.newArrivalBooks,
    required this.categories,
    required this.userModel,
  });

  final GlobalKey<ScaffoldState> scaffoldkey;
  final LoginUserModel userModel;
  final List<String> slinderImages;
  final List<CategoryModel> categories;
  final List<BookModel> bestSellerBooks;
  final List<BookModel> newArrivalBooks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(
          scaffoldkey: scaffoldkey,
          userModel: userModel,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SliderSection(
                  slinderImages: slinderImages,
                ),
                BestSellerSection(
                  bestSellerBooks: bestSellerBooks,
                ),
                const SizedBox(height: 15),
                BannarsSection(
                  bannarImages: slinderImages,
                ),
                const SizedBox(height: 15),
                CategoriesSection(
                  categories: categories,
                ),
                const SizedBox(height: 15),
                NewArrivalSection(
                  newArrivalBooks: newArrivalBooks,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
