import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../product_review/product_reviews.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_image_with_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_and_share.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold (

      bottomNavigationBar: const TBottomAddToCart(),

      body: SingleChildScrollView (

        child: Column (

          children: [
            /// 1 Product Image Slider
            const ProductImageWithSlider(),

            Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),

              child: Column (

                children: [

                  /// Rating and Share button
                  const RatingAndShare(),

                  /// Price, Title, Stock and and Brand
                  const ProductMetaData(),

                  /// Attributes
                  const ProductAttributes(),
                  const Gap(TSizes.spaceBetweenSections),

                  /// Checout
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const Gap(TSizes.spaceBetweenSections),

                  /// Description
                  const SeactionHeading(title: 'Description', showActionButton: false, textColor: TColors.black),
                  const Gap(TSizes.spaceBtwItems),
                  const ReadMoreText (
                    'This is a product description for nike blue shoes, Here we can add as much information as we want as per our requirements and product needs.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const Gap(TSizes.spaceBtwItems),
                  Row (

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SeactionHeading(title: 'Review (199)', textColor: TColors.black, showActionButton: false),
                      IconButton(
                        onPressed: () => Get.to(() => const TProductReviews()), icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        )
      ),
    );
  }
}
