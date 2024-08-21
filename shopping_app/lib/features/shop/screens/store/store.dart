import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/appbar/tab_bar.dart';
import 'package:e_commerce/common/widgets/cart_counter_icon.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_card.dart';
import 'package:e_commerce/common/widgets/search_container.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/features/shop/screens/all_brands/all_brands.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../controllers/category_conroller.dart';
import 'widget/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryConroller.instance.featuredCategoies;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
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
                            SeactionHeading(
                                title: 'Featured Brands',
                                textColor: TColors.black,
                                onPressed: () =>
                                    Get.to(() => const AllBrandsScreen())),

                            /// -- Brand Grid
                            const Gap(TSizes.spaceBetweenSections / 1.5),
                            GridLayout(
                                itemCount: 4,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  return const TBrandCard(showBorder: true);
                                })
                          ],
                        )),
                    bottom: TTabBar(
                        tabs: categories
                            .map((cat) => Tab(child: Text(cat.name)))
                            .toList()),
                  )
                ];
              },
              body: TabBarView(
                  children: categories
                      .map((category) => TCategoryTab(category: category))
                      .toList()))),
    );
  }
}
