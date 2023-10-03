import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/book_details/presentation/manager/cubit/book_details_cubit.dart';
import 'package:book_store_eraa/Features/book_details/presentation/manager/cubit/book_details_state.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});
  static const id = 'BookDetails';

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool isliked = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String bookID = ModalRoute.of(context)!.settings.arguments as String;
      BlocProvider.of<BookDetailsCubit>(context).getBookDetails(bookId: bookID);
    });
  }

  @override
  Widget build(BuildContext context) {
    var bookcbt = BlocProvider.of<BookDetailsCubit>(context);
    return BlocConsumer<BookDetailsCubit, BookDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: bookcbt.bookModel == null
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 400.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            bookcbt.bookModel!.image!),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 40.w, top: 30.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            size: 50,
                                            color: AppColors.primaryswatch,
                                          ),
                                        ),
                                        LikeButton(
                                          circleColor: const CircleColor(
                                              start: AppColors.primaryswatch,
                                              end: AppColors.primaryswatch),
                                          bubblesColor: const BubblesColor(
                                            dotPrimaryColor:
                                                AppColors.primaryswatch,
                                            dotSecondaryColor:
                                                AppColors.primaryswatch,
                                          ),
                                          isLiked: isliked,
                                          likeBuilder: (isLiked) {
                                            if (isLiked) {
                                              return const Icon(
                                                Icons.favorite,
                                                size: 50,
                                                color: AppColors.primaryswatch,
                                              );
                                            } else {
                                              return const Icon(
                                                Icons.favorite_outline,
                                                size: 50,
                                                color: AppColors.primaryswatch,
                                              );
                                            }
                                          },
                                          onTap: (isLiked) {
                                            if (isLiked) {
                                              BlocProvider.of<HomeCubit>(
                                                      context)
                                                  .removeFromWish(
                                                      id: bookcbt.bookModel!.id
                                                          .toString());
                                              setState(() {
                                                isliked = false;
                                              });
                                              return Future(() => isLiked);
                                            } else {
                                              BlocProvider.of<HomeCubit>(
                                                      context)
                                                  .addToWish(
                                                      id: bookcbt.bookModel!.id
                                                          .toString());
                                              setState(() {
                                                isliked = true;
                                              });
                                              return Future(() => isLiked);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bookcbt.bookModel!.name!,
                                      style: AppStyles.textStyle34w900.copyWith(
                                        color: AppColors.colorBlack,
                                        fontSize: 26.sp,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          bookcbt.bookModel!.category!,
                                          style: AppStyles.textStyle24w400
                                              .copyWith(
                                            fontSize: 16.sp,
                                            color: AppColors.colorBlack
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "${bookcbt.bookModel!.price!} L.E",
                                              style: AppStyles.textStyle24w400
                                                  .copyWith(
                                                fontSize: 13.sp,
                                                color: AppColors.colorBlack
                                                    .withOpacity(0.3),
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            Text(
                                              "${bookcbt.bookModel!.priceAfterDiscount.toString()} L.E",
                                              style: AppStyles.textStyle24w400
                                                  .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.primaryswatch,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "Description:",
                                      style: AppStyles.textStyle34w900.copyWith(
                                        color: AppColors.colorBlack,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      bookcbt.bookModel!.description!,
                                      style: AppStyles.textStyle24w400.copyWith(
                                        fontSize: 14.sp,
                                        color: AppColors.colorBlack
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.primaryswatch,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                )),
                            onPressed: () {
                              BlocProvider.of<HomeCubit>(context).addToCart(
                                  id: bookcbt.bookModel!.id!.toString());
                            },
                            child: Text(
                              "Add To Cart",
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyle24w400.copyWith(
                                fontSize: 16.sp,
                                color: AppColors.colorWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
