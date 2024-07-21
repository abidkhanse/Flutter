
import 'package:e_commerce/common/widgets/vertical_image_and_text.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder (
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageAndText (
            image: TImages.emailSentColored,
            title: "Facebook",
            onTapp: () => Get.to( () => const SubCategoryScreen()), 
            textColor: TColors.white,
          );
        },
      ),
    );
  }
}