import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/checkout/presentation/views/checkout.dart';
import 'package:book_store_eraa/Features/home/data/models/cart_model.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_state.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key, required this.cartbooks, required this.cartModel});
  final List<CartItems> cartbooks;
  final CartModel cartModel;

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15.r),
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
                              padding: EdgeInsets.only(top: 300.h),
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
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.all(10.r),
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryswatch,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Total price :  ${widget.cartModel.total ?? 0.0} L.E',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.colorWhite,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, CheckOut.id);
                          },
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: AppColors.colorWhite,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Center(
                              child: Text(
                                'CheckOut',
                                style: AppStyles.textStyle24w400.copyWith(
                                  fontSize: 14.sp,
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
