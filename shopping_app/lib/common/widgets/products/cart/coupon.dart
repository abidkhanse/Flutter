
import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final isDark = THelperFunction.isDarkMode(context);
    
    return RoundedContainer (
      showBorder: true,
      backgroundColor: isDark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only (
          top: TSizes.sm,
          bottom: TSizes.sm,
          right: TSizes.sm,
          left: TSizes.sm
      ),
      child: Row (
        children: [
          Flexible(
              child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter promo code.',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          )),
          
          SizedBox (
    
            width: 100,
            child: ElevatedButton (
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark ? TColors.white.withOpacity(0.5)  : TColors.dark.withOpacity(0.5),
                backgroundColor: TColors.grey.withOpacity(0.2),
                side: BorderSide(color: TColors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply')
            )
    
          )
        ],
      ),
    );
  }
}
