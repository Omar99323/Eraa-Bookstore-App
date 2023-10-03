// ignore_for_file: body_might_complete_normally_nullable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Core/utils/app_styles.dart';
import 'package:book_store_eraa/Core/widgets/custom_form_field.dart';
import 'package:book_store_eraa/Features/checkout/data/models/city_model.dart';
import 'package:book_store_eraa/Features/checkout/presentation/manager/cubit/check_out_cubit.dart';
import 'package:book_store_eraa/Features/checkout/presentation/manager/cubit/check_out_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});
  static const id = 'CheckOut';

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  GlobalKey<FormState> key = GlobalKey();
  String? email;
  String? name;
  String? phone;
  String? address;
  String? cityId;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckOutCubit>(context).checkout();
    BlocProvider.of<CheckOutCubit>(context).getCities();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        if (state is MakeAnOrder) {
          Navigator.pop(context);
          AnimatedSnackBar.material("Order made Successfully",
                  type: AnimatedSnackBarType.success)
              .show(context);
        }
      },
      builder: (context, state) {
        var checkcbt = BlocProvider.of<CheckOutCubit>(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 20.h,
              ),
              child: checkcbt.checkoutModel == null || checkcbt.cityies.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: key,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
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
                            SizedBox(height: 15.h),
                            CustomFormField(
                              onchange: (p0) {
                                email = p0;
                              },
                              inputType: TextInputType.emailAddress,
                              initvalue:
                                  checkcbt.checkoutModel!.user!.userEmail,
                              label: 'Email',
                              prefixicon: const Icon(
                                Icons.email,
                                color: AppColors.primaryswatch,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            CustomFormField(
                              onchange: (p0) {
                                phone = p0;
                              },
                              inputType: TextInputType.phone,
                              initvalue: checkcbt.checkoutModel!.user!.phone,
                              label: 'Phone',
                              prefixicon: const Icon(
                                Icons.phone,
                                color: AppColors.primaryswatch,
                              ),
                              validator: (p0) {
                                if (p0 == "null" &&
                                    checkcbt.checkoutModel!.user!.phone ==
                                        "null") {
                                  return 'Phone must not be empty';
                                }
                              },
                            ),
                            SizedBox(height: 15.h),
                            CustomFormField(
                              onchange: (p0) {
                                address = p0;
                              },
                              validator: (p0) {
                                if (p0 == "null" &&
                                    checkcbt.checkoutModel!.user!.address ==
                                        "null") {
                                  return 'Address must not be empty';
                                }
                              },
                              initvalue: checkcbt.checkoutModel!.user!.address,
                              label: 'Address',
                              prefixicon: const Icon(
                                Icons.location_city,
                                color: AppColors.primaryswatch,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            SizedBox(
                              height: 50.h,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  hintStyle: AppStyles.textStyle34w900.copyWith(
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
                                    fontSize: 16.sp,
                                  ),
                                ),
                                items: dropsList(list: checkcbt.cityies),
                                onChanged: (value) {
                                  cityId = value;
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'City must be choosen';
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 10.h),
                            const Divider(thickness: 2),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 220.h,
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: checkcbt
                                        .checkoutModel!.cartItems!.isEmpty
                                    ? 1
                                    : checkcbt.checkoutModel!.cartItems!.length,
                                itemBuilder: (context, index) => checkcbt
                                        .checkoutModel!.cartItems!.isEmpty
                                    ? Padding(
                                        padding: EdgeInsets.only(top: 50.h),
                                        child: Center(
                                            child: Text(
                                          'There is nothing to checkout',
                                          style: AppStyles.textStyle34w900
                                              .copyWith(
                                            fontSize: 20.sp,
                                          ),
                                        )),
                                      )
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
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    AppStyles.textStyle24w400,
                                              ),
                                              SizedBox(height: 10.h),
                                              Text(
                                                'Quantity : ${checkcbt.checkoutModel!.cartItems![0].itemQuantity}',
                                                style: AppStyles.textStyle24w400
                                                    .copyWith(
                                                  fontSize: 14.sp,
                                                  color: AppColors.colorBlack
                                                      .withOpacity(0.4),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 350,
                                                child: Text(
                                                  checkcbt
                                                      .checkoutModel!
                                                      .cartItems![index]
                                                      .itemProductName!,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      AppStyles.textStyle24w400,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Text(
                                                'Quantity : ${checkcbt.checkoutModel!.cartItems![index].itemQuantity}',
                                                style: AppStyles.textStyle24w400
                                                    .copyWith(
                                                  fontSize: 14.sp,
                                                  color: AppColors.colorBlack
                                                      .withOpacity(0.4),
                                                ),
                                              ),
                                            ],
                                          ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 15.h),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              padding: EdgeInsets.all(10.r),
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: AppColors.primaryswatch,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Total price :  ${checkcbt.checkoutModel!.total} L.E',
                                    style: AppStyles.textStyle24w400.copyWith(
                                      fontSize: 16.sp,
                                      color: AppColors.colorWhite,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      if (key.currentState!.validate()) {
                                        checkcbt.makeOrder(
                                          name: name ??
                                              checkcbt
                                                  .checkoutModel!.user!.userId
                                                  .toString(),
                                          cityID: cityId!,
                                          phone: phone ??
                                              checkcbt
                                                  .checkoutModel!.user!.phone!,
                                          email: email ??
                                              checkcbt.checkoutModel!.user!
                                                  .userEmail!,
                                          address: address ??
                                              checkcbt.checkoutModel!.user!
                                                  .address!,
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.colorWhite,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Order Now!',
                                          style: AppStyles.textStyle24w400
                                              .copyWith(
                                            fontSize: 16.sp,
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
                    ),
            ),
          ),
        );
      },
    );
  }

  List<DropdownMenuItem> dropsList({required List<CityModel> list}) {
    List<DropdownMenuItem> items = [];
    items.clear();
    for (var item in list) {
      items.add(
        DropdownMenuItem(
          value: item.id.toString(),
          child: Row(
            children: [
              Text(item.id.toString()),
              const SizedBox(width: 10),
              Text(item.name!),
            ],
          ),
        ),
      );
    }
    return items;
  }
}
