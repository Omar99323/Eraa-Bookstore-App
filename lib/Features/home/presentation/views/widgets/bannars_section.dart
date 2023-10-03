import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannarsSection extends StatelessWidget {
  const BannarsSection({
    super.key,
    required this.bannarImages,
  });
  final List<String> bannarImages;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: bannarImages.length,
      itemBuilder: (context, index, realIndex) => Container(
        decoration: BoxDecoration(
          color: AppColors.primaryswatch,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(bannarImages[index]),
            fit: BoxFit.fill,
          ),
        ),
      ),
      options: CarouselOptions(
        height: 160.h,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
