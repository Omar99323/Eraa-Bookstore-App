import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/book_details/presentation/views/book_details.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:flutter/widgets.dart';

class BestSellerBook extends StatelessWidget {
  const BestSellerBook({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, BookDetails.id,
          arguments: bookModel.id.toString()),
      child: SizedBox(
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 130,
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
              height: 10,
            ),
            SizedBox(
              width: 120,
              child: Text(
                bookModel.name!,
                textAlign: TextAlign.center,
                style: AppStyles.textStyle24w400.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 90,
              child: Text(
                bookModel.category!,
                textAlign: TextAlign.center,
                style: AppStyles.textStyle24w400.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorBlack.withOpacity(0.3),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
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
            Text(
              "${bookModel.priceAfterDiscount!.toString()} L.E",
              textAlign: TextAlign.center,
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 13,
                color: AppColors.primaryswatch,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
