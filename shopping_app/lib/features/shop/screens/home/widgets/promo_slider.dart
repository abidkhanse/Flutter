
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/circular_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/features/shop/controllers/home_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key, required this.images,
  });

  final List<String> images ;
    
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());

    return Column (
      children: [
        CarouselSlider (

          options: CarouselOptions (
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updateCarouselCurrentInexe(index),
            ),

            items: images.map((url) => Padding (
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: RoundedImage(imageUrl: url),
            )).toList(),
       
        ),
    
        const Gap (TSizes.spaceBtwItems),
        Obx (
          () => Row (
            mainAxisSize: MainAxisSize.min,
            children: [
              for ( int i = 0; i < images.length; i++ ) TCircularContainer(width: 20, height: 2, margin: const EdgeInsets.only(right: 8), 
                backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
