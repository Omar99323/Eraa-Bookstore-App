import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({
    super.key,
    required this.slinderImages,
  });
  final List<String> slinderImages;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: slinderImages.length,
      itemBuilder: (context, index, realIndex) => Container(
        decoration: BoxDecoration(
          color: AppColors.primaryswatch,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(slinderImages[index]),
            fit: BoxFit.fill,
          ),
        ),
      ),
      options: CarouselOptions(
        height: 140.h,
        enableInfiniteScroll: true,
        autoPlay: true,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
