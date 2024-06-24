import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_showcase.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ListView (

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowcase(images: [
                TImages.clothIcon,
                TImages.clothIcon2,
                TImages.clothIcon3
              ]),
              const Gap(TSizes.spaceBtwItems),
              SeactionHeading(
                  title: 'You might like it',
                  textColor: TColors.black,
                  onPressed: () {}),
              const Gap(TSizes.spaceBtwItems),
              GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
