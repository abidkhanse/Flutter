
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard ({

    super.key,
    this.onPressed,
    required this.showBorder

  });

  final bool showBorder;
  final void Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
  
    return GestureDetector (

    onTap: onPressed,
    child: RoundedContainer (
      
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,

        
        child: Row (

          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
          Flexible (
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
  }
}