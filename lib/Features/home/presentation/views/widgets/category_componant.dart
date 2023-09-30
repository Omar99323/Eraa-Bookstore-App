import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryComponant extends StatelessWidget {
  const CategoryComponant({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 130,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorBlack,
              image: const DecorationImage(
                opacity: 0.6,
                image: NetworkImage(
                    'https://img.freepik.com/free-vector/books-stack-realistic_1284-4735.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            categoryModel.name!,
            style: AppStyles.textStyle24w400.copyWith(
              color: AppColors.colorWhite,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
