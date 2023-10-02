import 'package:book_store_eraa/Features/home/data/models/book_model.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/wishbook_componant.dart';
import 'package:flutter/widgets.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key, required this.wishlistBooks,});
  
    final List<BookModel> wishlistBooks;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: wishlistBooks.isEmpty ? 2 : wishlistBooks.length,
          itemBuilder: (context, index) => wishlistBooks.isEmpty
              ? const SizedBox()
              : wishlistBooks.length == 1
                  ? WishBookComponant(
                      bookModel: wishlistBooks[0],
                    )
                  : WishBookComponant(
                      bookModel: wishlistBooks[index],
                    ),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
        ),
      ),
    );
  }
}
