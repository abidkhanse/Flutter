import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/features/shop/screens/product_review/widgets/rating_bar_indicator.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = THelperFunction.isDarkMode(context);
    
    return Column (
      children: [
        Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row (
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userIcon)),
                const Gap(TSizes.spaceBtwItems),
                Text('John woo', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const Gap(TSizes.spaceBtwItems),

        Row (children: [
          const TRatingBarIndicator(rating: 4),
          const Gap(TSizes.spaceBtwItems),
          Text('01, Nov 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const Gap(TSizes.spaceBtwItems),
        
        const ReadMoreText (
          'This is the user feedback about this product, product is world class and high quality product. Can not believe, got this product on less price. This is the user feedback about this product, product is world class and high quality product. Can not believe, got this product on less price.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
        ),

        const Gap(TSizes.spaceBtwItems),

        RoundedContainer (
          backgroundColor: isDark ? TColors.darkGrey : TColors.grey,
          child: Padding (
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Zara Store', style: Theme.of(context).textTheme.titleMedium),
                    Text('02 Nov 2023', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),

                const Gap(TSizes.spaceBtwItems),

                const ReadMoreText (
                  'This is the user feedback about this product, product is world class and high quality product. Can not believe, got this product on less price. This is the user feedback about this product, product is world class and high quality product. Can not believe, got this product on less price.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  
                )
              ]
            ),
          ),
        ),
        const Gap(TSizes.spaceBetweenSections),
      ],
    );
  }
}