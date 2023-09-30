import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/category_componant.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
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
        SizedBox(
          height: 130,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) => const CategoryComponant(),
            separatorBuilder: (context, index) => const SizedBox(width: 6),
          ),
        ),
      ],
    );
  }
}
