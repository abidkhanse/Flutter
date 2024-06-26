
import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/curved_widget.dart';
import 'package:e_commerce/common/widgets/icons/circular_Icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageWithSlider extends StatelessWidget {
  const ProductImageWithSlider({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {

    bool isDark = THelperFunction.isDarkMode(context);

    return CurvedEdgeWidget (

      child: Container (
        color: isDark ? TColors.dark : TColors.light,
        child: Stack (
          children: [
            /// 1. main large image
            const SizedBox (
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Image( image: AssetImage(TImages.productImage_11)),
              )
            ),
    
            Positioned (
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox (
                height: 80,
                child: ListView.separated (
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems), 
                  
                  itemBuilder: (_, index) => RoundedImage (
                
                    width: 80,
                    backgroundColor: isDark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.grey),
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.productImage_11,
                  ), 
                ),
              ),
            ),
    
            const ApplicationBar (
              showBackArrorw: true,
              actions: [TCircularIcon(icon: Iconsax.heart5, color: TColors.red)],
            )
    
          ],
        ),
      ),
    );
  }
}

