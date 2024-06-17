import 'package:e_commerce/common/widgets/application_bar.dart';
import 'package:e_commerce/common/widgets/primary_header_container.dart';
import 'package:e_commerce/common/widgets/search_container.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'widgets/home_application_bar.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
                child: Column(
              children: [
                HomeAppBar(message: 'Welcome to the store', name: 'Abid Khan'),
                Gap(TSizes.defaultSpace),

                // SearchBar
                SearchContainer(text: 'Search in Store'),
                Gap(TSizes.defaultSpace),

                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      SeactionHeading (
                        title: 'Popular Categories', showActionButton: false),
                        Gap(TSizes.spaceBtwItems),

                        HomeCategories(),
                     ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

