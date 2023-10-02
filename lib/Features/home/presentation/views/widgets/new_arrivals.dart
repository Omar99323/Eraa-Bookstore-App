import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/best_seller_book.dart';
import 'package:flutter/material.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({super.key, required this.newArrivalBooks});
  final List<BookModel> newArrivalBooks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'New Arrival',
          style: AppStyles.textStyle24w400.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 330,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: newArrivalBooks.length,
            itemBuilder: (context, index) => BestSellerBook(
              bookModel: newArrivalBooks[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),
      ],
    );
  }
}
