import 'package:e_commerce/common/widgets/application_bar.dart';
import 'package:e_commerce/common/widgets/cart_counter_icon.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/search_container.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../utils/constants/colors.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ApplicationBar(
            title: Text('Store',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              CartCounterIcon(
                  onPressed: () {}, count: '5', iconColor: TColors.dark)
            ]),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerScrollableBox) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunction.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          /// -- search bar
                          const Gap(TSizes.spaceBtwItems),
                          const SearchContainer(
                              text: 'Seach in store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          const Gap(TSizes.spaceBetweenSections),

                          /// -- heading
                          SeactionHeading (
                              title: 'Featured Brands',
                              textColor: TColors.black,
                              onPressed: () {}
                          ),

                          const Gap(TSizes.spaceBetweenSections / 1.5),
                          GridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
                            return   GestureDetector (
                            onTap: () {},
                            child: RoundedContainer (
                              
                                padding: const EdgeInsets.all(TSizes.sm),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(children: [

                                  Flexible(
                                    child: CircularImage (
                                        image: TImages.clothIcon,
                                        isNetworkImage: false,
                                        backgroundColor: Colors.transparent,
                                        overlayColor:
                                            THelperFunction.isDarkMode(context)
                                                ? TColors.white
                                                : TColors.black
                                    ),
                                  ),
                              
                                const Gap(TSizes.spaceBtwItems / 2),
                            
                                Expanded (
                                  
                                  child: Column (
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const BrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.large),
                                      Text('256 products', overflow:TextOverflow.ellipsis ,style: Theme.of(context).textTheme.labelMedium)
                                    ],
                                  ),
                                ),
                            ])),
                          );
                          })
                        
                        ],
                      )),
                )
              ];
            },
            body: Container()));
  }
}
