import 'package:e_commerce/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../images/rounded_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
        RoundedImage (
          imageUrl: TImages.shoesIcon1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkGrey : TColors.light,
        ),
        const Gap(TSizes.spaceBtwItems),
        Expanded (
          child: Column (
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: ProductTitleText(title: 'Sports Shoe', maxLines: 1)),
              Text.rich (
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan (
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan (
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan (
                      text: 'UK 08 ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ]
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}