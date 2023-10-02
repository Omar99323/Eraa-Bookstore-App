// ignore_for_file: body_might_complete_normally_nullable
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Core/widgets/custom_form_field.dart';
import 'package:book_store_eraa/Features/checkout/data/models/city_model.dart';
import 'package:book_store_eraa/Features/checkout/presentation/manager/cubit/check_out_cubit.dart';
import 'package:book_store_eraa/Features/checkout/presentation/manager/cubit/check_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});
  static const id = 'CheckOut';

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String? email;
  String? name;
  String? phone;
  String? address;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var checkcbt = BlocProvider.of<CheckOutCubit>(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: checkcbt.checkoutModel == null || checkcbt.cityies.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          CustomFormField(
                            initvalue: checkcbt.checkoutModel!.user!.userName,
                            label: 'Name',
                            prefixicon: const Icon(
                              Icons.person,
                              color: AppColors.primaryswatch,
                            ),
                            onchange: (p0) {
                              name = p0;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomFormField(
                            onchange: (p0) {
                              email = p0;
                            },
                            inputType: TextInputType.emailAddress,
                            initvalue: checkcbt.checkoutModel!.user!.userEmail,
                            label: 'Email',
                            prefixicon: const Icon(
                              Icons.email,
                              color: AppColors.primaryswatch,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomFormField(
                            onchange: (p0) {
                              phone = p0;
                            },
                            inputType: TextInputType.phone,
                            initvalue:
                                checkcbt.checkoutModel!.user!.phone ?? 'null',
                            label: 'Phone',
                            prefixicon: const Icon(
                              Icons.phone,
                              color: AppColors.primaryswatch,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomFormField(
                            onchange: (p0) {
                              address = p0;
                            },
                            initvalue:
                                checkcbt.checkoutModel!.user!.address ?? 'null',
                            label: 'Address',
                            prefixicon: const Icon(
                              Icons.location_city,
                              color: AppColors.primaryswatch,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 80,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                hintStyle: AppStyles.textStyle34w900.copyWith(
                                  fontSize: 20,
                                  color: AppColors.colorBlack,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: AppColors.primaryswatch,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryswatch,
                                    width: 1,
                                  ),
                                ),
                              ),
                              hint: Text(
                                'Select City',
                                style: AppStyles.textStyle24w400.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              items: dropsList(list: checkcbt.cityies),
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(thickness: 2),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: checkcbt
                                            .checkoutModel!.cartItems!.isEmpty
                                        ? 1
                                        : checkcbt
                                            .checkoutModel!.cartItems!.length,
                                    itemBuilder: (context, index) => checkcbt
                                            .checkoutModel!.cartItems!.isEmpty
                                        ? const Text(
                                            'There is nothing to checkout')
                                        : checkcbt.checkoutModel!.cartItems!
                                                    .length ==
                                                1
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    checkcbt
                                                        .checkoutModel!
                                                        .cartItems![0]
                                                        .itemProductName!,
                                                    style: AppStyles
                                                        .textStyle24w400,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'Quantity : ${checkcbt.checkoutModel!.cartItems![0].itemQuantity}',
                                                    style: AppStyles
                                                        .textStyle24w400
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: AppColors
                                                          .colorBlack
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    checkcbt
                                                        .checkoutModel!
                                                        .cartItems![index]
                                                        .itemProductName!,
                                                    style: AppStyles
                                                        .textStyle24w400,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'Quantity : ${checkcbt.checkoutModel!.cartItems![index].itemQuantity}',
                                                    style: AppStyles
                                                        .textStyle24w400
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: AppColors
                                                          .colorBlack
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 20),
                                  ),
                                ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text(
                                //       checkcbt.checkoutModel!.cartItems![0]
                                //           .itemProductName!,
                                //       style: AppStyles.textStyle24w400,
                                //     ),
                                //     const SizedBox(height: 10),
                                //     Text(
                                //       'Quantity : ${checkcbt.checkoutModel!.cartItems![0].itemQuantity}',
                                //       style: AppStyles.textStyle24w400.copyWith(
                                //         fontSize: 14,
                                //         color:
                                //             AppColors.colorBlack.withOpacity(0.4),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Column(
                                  children: [
                                    Text(
                                      'Total',
                                      style: AppStyles.textStyle24w400.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      checkcbt.checkoutModel!.total.toString(),
                                      style: AppStyles.textStyle24w400.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  'Order Now!',
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
            ),
          ),
        );
      },
    );
  }

  List<DropdownMenuItem> dropsList({required List<CityModel> list}) {
    List<DropdownMenuItem> items = [];
    for (var item in list) {
      items.add(DropdownMenuItem(
          value: item.id,
          child: Row(
            children: [
              Text(item.id.toString()),
              const SizedBox(width: 10),
              Text(item.name!),
            ],
          )));
    }
    return items;
  }
}
