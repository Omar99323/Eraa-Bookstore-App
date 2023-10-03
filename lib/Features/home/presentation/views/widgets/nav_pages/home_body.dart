import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/data/models/category_model.dart';
import 'package:book_store_eraa/Features/home/data/models/user_model.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/bannars_section.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/best_seller_section.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/categories_section.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/home_appbar.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/new_arrivals.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/slider_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final UserModel userModel;

  final List<String> slinderImages;
  final List<CategoryModel> categories;
  final List<BookModel> bestSellerBooks;
  final List<BookModel> newArrivalBooks;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(
              scaffoldkey: scaffoldkey,
              username: userModel.name!,
              userimage: userModel.image!,
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SliderSection(
                      slinderImages: slinderImages,
                    ),
                    SizedBox(height: 15.h),
                    BestSellerSection(
                      bestSellerBooks: bestSellerBooks,
                    ),
                    SizedBox(height: 10.h),
                    BannarsSection(
                      bannarImages: slinderImages,
                    ),
                    SizedBox(height: 15.h),
                    CategoriesSection(
                      categories: categories,
                    ),
                    SizedBox(height: 15.h),
                    NewArrivalSection(
                      newArrivalBooks: newArrivalBooks,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
