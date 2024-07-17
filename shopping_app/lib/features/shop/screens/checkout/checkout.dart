import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/email_verification_success.dart';
import 'package:e_commerce/common/widgets/products/cart/coupon.dart';
import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/features/shop/screens/checkout/widget/biling_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widget/biling_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widget/biling_payment_section.dart';
import 'package:e_commerce/navigation_bar.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../cart/widget/cart_item.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);

    return Scaffold(
        appBar: ApplicationBar(
          showBackArrorw: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            const TCartItem(showAddRemoveButton: false),
            const TCouponCode(),
            const Gap(TSizes.spaceBetweenSections),
            RoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: isDark ? Colors.black : Colors.white,
              child: const Column(
                children: [
                  TBillingAmountSection(),
                  Gap(TSizes.spaceBtwItems),
                  Divider(),
                  Gap(TSizes.spaceBtwItems),
                  TBillingPaymentSection(),
                  Gap(TSizes.spaceBtwItems),
                  TBillingAddressSection(),
                ],
              ),
            )
          ]),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => Get.to(
                    () => SuccessScreen(
                        image: TImages.paymentSuccessful,
                        title: 'Payment Success!',
                        subTitle: 'Your item will be shipped soon',
                        onPressed: () => Get.offAll(() => const ApplicationNavigationBar())),
                  ),
              child: const Text('Checkout 264.0')),
        ));
  }
}
