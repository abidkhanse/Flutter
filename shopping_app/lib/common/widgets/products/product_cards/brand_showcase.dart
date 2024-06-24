
import 'package:e_commerce/common/widgets/products/product_cards/brand_card.dart';
import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TBrandShowcase extends StatelessWidget {

  const TBrandShowcase
  
  ({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column (
        children: [
          const TBrandCard(showBorder: false),
          const Gap(TSizes.spaceBtwItems),

          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList())                  
      ],),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {

  return Expanded (
    child: RoundedContainer (
      height: 100,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(right: TSizes.sm),
      backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkGrey : TColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),      
    )
  );

}

