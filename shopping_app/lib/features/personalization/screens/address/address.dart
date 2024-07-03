import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (

      floatingActionButton: FloatingActionButton (
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddress()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),

      appBar: ApplicationBar (
        showBackArrorw: true, 
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView (
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false),
              SingleAddress(selectedAddress: true)
            ],
          )
        ),
      ),
    );
  }
}