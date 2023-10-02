import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/book_details/presentation/views/book_details.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class WishBookComponant extends StatelessWidget {
  const WishBookComponant({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    double discountprice = double.parse(bookModel.price!) -
        (double.parse(bookModel.price!) * (bookModel.discount! / 100));

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, BookDetails.id,
          arguments: bookModel.id.toString()),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                if (bookModel.image != null)
                  Container(
                    height: 200,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorBlack,
                      image: DecorationImage(
                        image: NetworkImage(bookModel.image!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 50,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.primaryswatch,
                    ),
                    child: Center(
                      child: Text(
                        "${bookModel.discount!.toString()}%",
                        style: AppStyles.textStyle24w400.copyWith(
                          color: AppColors.colorWhite,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.name!,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    bookModel.category!,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorBlack.withOpacity(0.3),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${bookModel.price!} L.E",
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 13,
                      color: AppColors.colorBlack.withOpacity(0.3),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${discountprice.toStringAsFixed(1).toString()} L.E",
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 14,
                      color: AppColors.primaryswatch,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(
                  circleColor: const CircleColor(
                      start: AppColors.primaryswatch,
                      end: AppColors.primaryswatch),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: AppColors.primaryswatch,
                    dotSecondaryColor: AppColors.primaryswatch,
                  ),
                  isLiked: true,
                  likeBuilder: (isLiked) {
                    if (isLiked) {
                      return const Icon(
                        Icons.favorite,
                        size: 40,
                        color: AppColors.primaryswatch,
                      );
                    } else {
                      return const Icon(
                        Icons.favorite_outline,
                        size: 40,
                        color: Colors.black,
                      );
                    }
                  },
                  onTap: (isLiked) {
                    if (isLiked) {
                      BlocProvider.of<HomeCubit>(context)
                          .removeFromWish(id: bookModel.id.toString());
                      return Future(() => isLiked);
                    } else {
                      return Future(() => isLiked);
                    }
                  },
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.add_shopping_cart,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
