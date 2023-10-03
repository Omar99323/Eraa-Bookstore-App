import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/checkout/presentation/views/checkout.dart';
import 'package:book_store_eraa/Features/home/data/models/cart_model.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_state.dart';
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
        child: HomeStates is HomeCartBooksLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.cartbooks.isEmpty
                          ? 1
                          : widget.cartbooks.length,
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
                  const SizedBox(height: 20),
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
                          'Total price :  ${widget.cartModel.total ?? 0.0} L.E',
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
}
