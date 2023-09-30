// ignore_for_file: use_build_context_synchronously

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:book_store_eraa/Core/helpers/secure_storage.dart';
import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_state.dart';
import 'package:book_store_eraa/Features/home/presentation/views/widgets/mydrawer.dart';
import 'package:book_store_eraa/Features/login/presentation/views/login_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;
  String? email;
  String? image;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      name = await SecureStorage.getData(key: 'username');
      email = await SecureStorage.getData(key: 'useremail');
      image = await SecureStorage.getData(key: 'userimage');
      BlocProvider.of<HomeCubit>(context).getUserModel(
        name: name!,
        image: image!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeLogout) {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
          AnimatedSnackBar.material('Loggedout Successfullly',
                  type: AnimatedSnackBarType.success)
              .show(context);
        }
      },
      builder: (context, state) {
        var homecbt = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          key: homecbt.scaffoldkey,
          drawer: name == null || email == null || image == null
              ? const Drawer()
              : MyDrawer(
                  name: name!,
                  email: email!,
                  image: image!,
                ),
          bottomNavigationBar: CurvedNavigationBar(
            index: homecbt.navindex,
            height: 50,
            backgroundColor: AppColors.primaryswatch,
            items: <Widget>[
              Icon(
                Icons.home_filled,
                size: 30,
                color: homecbt.navindex == 0
                    ? AppColors.primaryswatch
                    : AppColors.colorBlack.withOpacity(0.3),
              ),
              Icon(
                Icons.book,
                size: 30,
                color: homecbt.navindex == 1
                    ? AppColors.primaryswatch
                    : AppColors.colorBlack.withOpacity(0.3),
              ),
              Icon(
                Icons.favorite_border,
                size: 30,
                color: homecbt.navindex == 2
                    ? AppColors.primaryswatch
                    : AppColors.colorBlack.withOpacity(0.3),
              ),
              Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: homecbt.navindex == 3
                    ? AppColors.primaryswatch
                    : AppColors.colorBlack.withOpacity(0.3),
              ),
              Icon(
                Icons.person,
                size: 30,
                color: homecbt.navindex == 4
                    ? AppColors.primaryswatch
                    : AppColors.colorBlack.withOpacity(0.3),
              ),
            ],
            onTap: (index) {
              homecbt.changeIndex(index);
            },
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: homecbt.slinderImgs.isEmpty ||
                      homecbt.listofBestSeller.isEmpty ||
                      homecbt.listofNewArrival.isEmpty ||
                      homecbt.listofCategories.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : homecbt.screens()[homecbt.navindex],
            ),
          ),
        );
      },
    );
  }
}
