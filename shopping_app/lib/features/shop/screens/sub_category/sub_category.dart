import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationBar(
          title: Text('Sports Shirts'), showBackArrorw: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const RoundedImage(
                  width: double.infinity,
                  height: null,
                  imageUrl: TImages.promotionImage_1,
                  applyImageRadius: true),
              const Gap(TSizes.spaceBetweenSections),
              Column(
                children: [
                  SeactionHeading(
                      title: 'Sports Shirts',
                      onPressed: () {},
                      textColor: TColors.black),
                  const Gap(TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const Gap(TSizes.spaceBtwItems),
                        itemBuilder: (context, index) =>
                            const ProductCardHorizontal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
