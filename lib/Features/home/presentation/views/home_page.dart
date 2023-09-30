import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:book_store_eraa/Features/home/presentation/manager/cubit/home_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var homecbt = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          key: homecbt.scaffoldkey,
          drawer: const Drawer(),
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
                vertical: 30,
              ),
              child: homecbt.slinderImgs.isEmpty||homecbt.listofBestSeller.isEmpty
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
