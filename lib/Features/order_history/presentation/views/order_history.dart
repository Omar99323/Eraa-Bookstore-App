import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Features/order_history/data/model/order_model.dart';
import 'package:book_store_eraa/Features/order_history/presentation/manager/cubit/order_history_cubit.dart';
import 'package:book_store_eraa/Features/order_history/presentation/manager/cubit/order_history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistory extends StatefulWidget {
  static const id = 'OrderHistory';

  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderHistoryCubit>(context).orderHistory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var ordercbt = BlocProvider.of<OrderHistoryCubit>(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 20.w,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Text(
                        'Orders History',
                        style: AppStyles.textStyle34w900.copyWith(
                          fontSize: 26.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          ordercbt.orders.isEmpty ? 1 : ordercbt.orders.length,
                      itemBuilder: (context, index) => ordercbt.orders.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: Center(
                                child: Text(
                                  'No orders for now!',
                                  style: AppStyles.textStyle34w900.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )
                          : ordercbt.orders.length == 1
                              ? OrderComponant(
                                  orderModel: ordercbt.orders[0],
                                )
                              : OrderComponant(
                                  orderModel: ordercbt.orders[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class OrderComponant extends StatelessWidget {
  const OrderComponant({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(orderModel.status!,
                  style: AppStyles.textStyle24w400
                      .copyWith(color: AppColors.primaryswatch)),
              Text(orderModel.orderDate!, style: AppStyles.textStyle24w400),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total : ', style: AppStyles.textStyle24w400),
              Text(orderModel.total!,
                  style: AppStyles.textStyle24w400
                      .copyWith(color: AppColors.primaryswatch)),
            ],
          ),
        ],
      ),
    );
  }
}
