import 'package:e_commerce/common/widgets/primary_header_container.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/search_container.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../common/widgets/layout/grid_layout.dart';
import 'widgets/home_application_bar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  Scaffold (
      body: SingleChildScrollView (
        child: Column (
          children: [
            const PrimaryHeaderContainer (
              child: Column (
                children: [
                  HomeAppBar(message: 'Welcome to the store', name: 'Abid Khan'),
                  Gap(TSizes.defaultSpace),
                  SearchContainer(text: 'Search in Store'),
                  Gap(TSizes.defaultSpace),
                  Padding (
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column (
                      children: [
                        SeactionHeading ( title: 'Popular Categories', showActionButton: false),
                        Gap(TSizes.spaceBtwItems),
                        HomeCategories(),
                        Gap(TSizes.spaceBtwItems * 4),
                      ],
                    ),
                  )
                ],
              )
            ),

            Padding (
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column (
                children: [
                  const PromoSlider(images: [TImages.promotionImage_4, TImages.promotionImage_1, TImages.promotionImage_2, TImages.promotionImage_3],),
                  const Gap(TSizes.spaceBetweenSections),
                  SeactionHeading(title: 'Popular Products', textColor: TColors.black, onPressed: () {}),                  
                  GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical())
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
