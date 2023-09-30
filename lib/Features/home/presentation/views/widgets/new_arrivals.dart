import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/best_seller_book.dart';
import 'package:flutter/material.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Arrival',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right_alt_sharp,
                size: 30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 350,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) =>  Container(),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),
      ],
    );
  }
}
// BestSellerBook(bookModel: null),