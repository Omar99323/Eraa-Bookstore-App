import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/book_componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksBody extends StatelessWidget {
  const BooksBody(
      {super.key, required this.allBooks, required this.searchBooks});

  final List<BookModel> allBooks;
  final List<BookModel> searchBooks;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          children: [
            TextField(
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.colorBlack.withOpacity(0.1),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.colorBlack,
                ),
                label: const Text('Search'),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primaryswatch),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.colorWhite),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.colorWhite),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onSubmitted: (value) {
                BlocProvider.of<HomeCubit>(context).search(name: value);
                BlocProvider.of<HomeCubit>(context).endSearchin();
              },
              onChanged: (value) {
                BlocProvider.of<HomeCubit>(context).searchin();
              },
            ),
            const SizedBox(height: 20),
            BlocProvider.of<HomeCubit>(context).searching
                ? const Expanded(
                    child: Center(
                      child: LinearProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: searchBooks.isEmpty
                          ? allBooks.length
                          : searchBooks.length,
                      itemBuilder: (context, index) => searchBooks.isEmpty
                          ? BookComponant(
                              bookModel: allBooks[index],
                            )
                          : searchBooks.length == 1
                              ? BookComponant(
                                  bookModel: searchBooks[0],
                                )
                              : BookComponant(
                                  bookModel: searchBooks[index],
                                ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
