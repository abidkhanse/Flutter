import 'package:e_commerce/common/widgets/shimmers/category_shimmer.dart';
import 'package:e_commerce/common/widgets/vertical_image_and_text.dart';
import 'package:e_commerce/features/shop/controllers/category_conroller.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryConroller = Get.put(CategoryConroller());

    return Obx(() {
      if (categoryConroller.isLoading.value) {
        return const TCategoryShimmer();
      }

      if (categoryConroller.featuredCategoies.isEmpty) {
        return Center(
            child: Text("No Data Found",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: TColors.white)));
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryConroller.featuredCategoies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryConroller.featuredCategoies[index];
            return VerticalImageAndText(
              image: category.image,
              title: category.name,
              onTapp: () => Get.to(() => const SubCategoryScreen()),
              textColor: TColors.white,
            );
          },
        ),
      );
    });
  }
}
