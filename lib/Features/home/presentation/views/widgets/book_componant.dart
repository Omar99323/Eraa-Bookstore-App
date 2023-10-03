import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/book_details/presentation/views/book_details.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

class BookComponant extends StatefulWidget {
  const BookComponant(
      {super.key, required this.bookModel, required this.wishids});
  final BookModel bookModel;
  final List<int> wishids;

  @override
  State<BookComponant> createState() => _BookComponantState();
}

class _BookComponantState extends State<BookComponant> {
  bool isliked = false;

  @override
  void initState() {
    super.initState();
    for (var id in widget.wishids) {
      if (widget.bookModel.id == id) {
        setState(() {
          isliked = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, BookDetails.id,
          arguments: widget.bookModel.id.toString()),
      child: Container(
        height: 170.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                if (widget.bookModel.image != null)
                  Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.colorBlack,
                      image: DecorationImage(
                        image: NetworkImage(widget.bookModel.image!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(6.r),
                  child: Container(
                    width: 48.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: AppColors.primaryswatch,
                    ),
                    child: Center(
                      child: Text(
                        "${widget.bookModel.discount!.toString()}%",
                        style: AppStyles.textStyle24w400.copyWith(
                          color: AppColors.colorWhite,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            SizedBox(
              width: 150.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.bookModel.name!,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.bookModel.category!,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorBlack.withOpacity(0.3),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${widget.bookModel.price!} L.E",
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.colorBlack.withOpacity(0.3),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${widget.bookModel.priceAfterDiscount!.toString()} L.E",
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 14.sp,
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
                  isLiked: isliked,
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
                          .removeFromWish(id: widget.bookModel.id.toString());
                      setState(() {
                        isliked = false;
                      });
                      return Future(() => isLiked);
                    } else {
                      BlocProvider.of<HomeCubit>(context)
                          .addToWish(id: widget.bookModel.id.toString());
                      setState(() {
                        isliked = true;
                      });
                      return Future(() => isLiked);
                    }
                  },
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<HomeCubit>(context)
                        .addToCart(id: widget.bookModel.id!.toString());
                  },
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
