import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            RoundedContainer (

              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black))
            
            ),

            const Gap(TSizes.spaceBtwItems),

            Text('250 \$', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const Gap(TSizes.spaceBtwItems),
            const ProductPriceText(price: '175', isLarge: true),
          ]
        ),

        const Gap(TSizes.spaceBtwItems / 1.5),
        const ProductTitleText(title: 'Blue Nike sports shoe'),
        const Gap(TSizes.spaceBtwItems / 1.5),

        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const Gap(TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const Gap(TSizes.spaceBtwItems / 1.5),
        const BrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.medium),
      ],
    );
  }
}