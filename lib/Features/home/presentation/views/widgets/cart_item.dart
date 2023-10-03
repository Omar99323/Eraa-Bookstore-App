import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/home/data/models/cart_model.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.book});
  final CartItems book;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int? quantity;
  @override
  void initState() {
    quantity = widget.book.itemQuantity!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 160.h,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.primaryswatch,
                  image: DecorationImage(
                    image: NetworkImage(widget.book.itemProductImage!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.book.itemProductName!,
                      style: AppStyles.textStyle24w400.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.w, color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity! < 10) {
                                      quantity = quantity! + 1;
                                      BlocProvider.of<HomeCubit>(context)
                                          .updateCart(
                                              id: widget.book.itemId!
                                                  .toString(),
                                              quantity: quantity.toString());
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: AppColors.primaryswatch,
                                ),
                              ),
                              Text(quantity.toString()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity! > 1) {
                                      quantity = quantity! - 1;

                                      BlocProvider.of<HomeCubit>(context)
                                          .updateCart(
                                              id: widget.book.itemId!
                                                  .toString(),
                                              quantity: quantity.toString());
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: AppColors.primaryswatch,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              "${widget.book.itemProductPrice} L.E",
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyle24w400.copyWith(
                                fontSize: 13.sp,
                                color: AppColors.colorBlack.withOpacity(0.3),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              "${widget.book.itemProductPriceAfterDiscount} L.E",
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyle24w400.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.primaryswatch,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.r),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<HomeCubit>(context)
                  .removeFromCart(id: widget.book.itemId!.toString());
            },
            child: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
