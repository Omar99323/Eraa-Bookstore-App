import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/book_details/presentation/manager/cubit/book_details_cubit.dart';
import 'package:book_store_eraa/Features/book_details/presentation/manager/cubit/book_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});
  static const id = 'BookDetails';

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
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
                                    height: 450,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            bookcbt.bookModel!.image!),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 50, top: 30),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bookcbt.bookModel!.name!,
                                      style: AppStyles.textStyle34w900.copyWith(
                                        color: AppColors.colorBlack,
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          bookcbt.bookModel!.category!,
                                          style: AppStyles.textStyle24w400
                                              .copyWith(
                                            fontSize: 16,
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
                                                fontSize: 13,
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
                                                fontSize: 14,
                                                color: AppColors.primaryswatch,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "Description:",
                                      style: AppStyles.textStyle34w900.copyWith(
                                        color: AppColors.colorBlack,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      bookcbt.bookModel!.description!,
                                      style: AppStyles.textStyle24w400.copyWith(
                                        fontSize: 16,
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.primaryswatch,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                )),
                            onPressed: () {},
                            child: Text(
                              "Add To Cart",
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyle24w400.copyWith(
                                fontSize: 16,
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
