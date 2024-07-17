import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar (
        showBackArrorw: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding (
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItem(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const Checkout()), child: const Text('Checkout \$234 ')),
      ),
    
    );
  }
}

