import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        RoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: isDark ? TColors.darkGrey : TColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    const SeactionHeading(
                        title: 'Variation',
                        textColor: TColors.black,
                        showActionButton: false),
                    const Gap(TSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const ProductTitleText(
                                title: 'Price', smallSize: true),
                            const Gap(TSizes.spaceBtwItems),
                            Text('25\$',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration:
                                            TextDecoration.lineThrough)),
                            const Gap(TSizes.spaceBtwItems),
                            const ProductPriceText(price: '20')
                          ],
                        ),
                        Row(
                          children: [
                            const ProductTitleText(
                                title: 'Stock : ', smallSize: true),
                            Text('In Stock',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const ProductTitleText(
                  title:
                      'This is a description of the product and it can go up to 4 lines',
                  smallSize: true,
                  maxLines: 4,
                ),
              ],
            )),
        const Gap(TSizes.spaceBtwItems),
        Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [       
            const SeactionHeading(title: 'Colors', textColor: TColors.black),
            const Gap(TSizes.spaceBtwItems / 2),
            Wrap(children: [
              TChoiceChip(text: 'orange', selected: false, onSelected: (value) {}),
              TChoiceChip(text: 'red', selected: false, onSelected: (value) {}),
              TChoiceChip(text: 'blue', selected: true, onSelected: (value) {}),
              TChoiceChip(text: 'yellow', selected: false, onSelected: (value) {}),
            ]),
          ],
        ),

        Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SeactionHeading(title: 'Sizes', textColor: TColors.black),
            const Gap(TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 32', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 34', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 42', selected: false, onSelected: (value) {}),
              ],
            )
          ]
        )
      ],
    );
  }
}
