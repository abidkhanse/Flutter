import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_card.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/features/shop/screens/all_products/brand_products.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationBar(title: Text('Brand'), showBackArrorw: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          const SeactionHeading(
            title: 'Brands',
            showActionButton: false,
            textColor: TColors.black,
          ),
          const Gap(TSizes.spaceBetweenSections),
          GridLayout(
              itemCount: 10,
              mainAxisExtent: 80,
              itemBuilder: (context, index) => TBrandCard(
                    showBorder: true,
                    onPressed: () => Get.to(() => const BrandProductsScreen()),
                    //    onPressed: () => Get.to(() => const TSortableProducts())
                  ))
        ]),
      )),
    );
  }
}
