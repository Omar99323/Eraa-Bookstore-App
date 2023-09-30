import 'package:book_store_eraa/Core/utils/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannarsSection extends StatelessWidget {
  const BannarsSection({
    super.key,
    required this.bannarImages,
  });
  final List<String> bannarImages;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) => Container(
        width: 390,
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
        height: 200,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
