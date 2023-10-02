import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/checkout/presentation/views/checkout.dart';
import 'package:book_store_eraa/Features/home/data/models/cart_model.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key, required this.cartbooks, required this.cartModel});
  final List<CartItems> cartbooks;
  final CartModel cartModel;

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount:
                    widget.cartbooks.isEmpty ? 1 : widget.cartbooks.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) => widget.cartbooks.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: Text(
                          'No books in cart for now!',
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle34w900,
                        ),
                      )
                    : widget.cartbooks.length == 1
                        ? CartItem(book: widget.cartbooks[0])
                        : CartItem(book: widget.cartbooks[index]),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryswatch,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    'Total price :  ${widget.cartModel.total} L.E',
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 16,
                      color: AppColors.colorWhite,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CheckOut.id);
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'CheckOut',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 16,
                            color: AppColors.primaryswatch,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Stack cartIItem({required CartItems book, required int quantity}) {
  //   return Stack(
  //     alignment: Alignment.topRight,
  //     children: [
  //       Container(
  //         height: 200,
  //         padding: const EdgeInsets.all(15),
  //         decoration: BoxDecoration(
  //           border: Border.all(width: 1, color: Colors.grey),
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Row(
  //           children: [
  //             Container(
  //               height: 200,
  //               width: 110,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 color: AppColors.colorBlack,
  //                 image: DecorationImage(
  //                   image: NetworkImage(book.itemProductImage!),
  //                   fit: BoxFit.fill,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 20,
  //             ),
  //             Expanded(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     book.itemProductName!,
  //                     style: AppStyles.textStyle24w400.copyWith(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                     maxLines: 2,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                   const SizedBox(
  //                     height: 30,
  //                   ),
  //                   Row(
  //                     children: [
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           border: Border.all(width: 1, color: Colors.grey),
  //                         ),
  //                         child: Row(
  //                           children: [
  //                             IconButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   if (quantity < 10) {
  //                                     ++quantity;
  //                                     BlocProvider.of<HomeCubit>(context)
  //                                         .updateCart(
  //                                             id: book.itemId!.toString(),
  //                                             quantity: quantity.toString());
  //                                     print(quantity);
  //                                   }
  //                                 });
  //                               },
  //                               icon: const Icon(
  //                                 Icons.add,
  //                                 color: AppColors.primaryswatch,
  //                               ),
  //                             ),
  //                             Text(book.itemQuantity.toString()),
  //                             IconButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   if (quantity > 1) {
  //                                     --quantity;
  //                                     BlocProvider.of<HomeCubit>(context)
  //                                         .updateCart(
  //                                             id: book.itemId!.toString(),
  //                                             quantity: quantity.toString());
  //                                     print(quantity);
  //                                   }
  //                                 });
  //                               },
  //                               icon: const Icon(
  //                                 Icons.remove,
  //                                 color: AppColors.primaryswatch,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const Spacer(),
  //                       Column(
  //                         children: [
  //                           Text(
  //                             "${book.itemProductPrice} L.E",
  //                             textAlign: TextAlign.center,
  //                             style: AppStyles.textStyle24w400.copyWith(
  //                               fontSize: 13,
  //                               color: AppColors.colorBlack.withOpacity(0.3),
  //                               decoration: TextDecoration.lineThrough,
  //                             ),
  //                           ),
  //                           Text(
  //                             "${book.itemProductPriceAfterDiscount} L.E",
  //                             textAlign: TextAlign.center,
  //                             style: AppStyles.textStyle24w400.copyWith(
  //                               fontSize: 14,
  //                               color: AppColors.primaryswatch,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: GestureDetector(
  //           onTap: () {
  //             BlocProvider.of<HomeCubit>(context)
  //                 .removeFromCart(id: book.itemId!.toString());
  //           },
  //           child: const Icon(
  //             Icons.delete,
  //             color: Colors.red,
  //             size: 30,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );

  // }
}
