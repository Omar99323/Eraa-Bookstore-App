import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/best_seller_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({
    super.key,
    required this.bestSellerBooks,
  });
  final List<BookModel> bestSellerBooks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Seller',
          style: AppStyles.textStyle24w400.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 260.h,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: bestSellerBooks.length,
            itemBuilder: (context, index) => BestSellerBook(
              bookModel: bestSellerBooks[index],
            ),
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
          ),
        ),
      ],
    );
  }
}
