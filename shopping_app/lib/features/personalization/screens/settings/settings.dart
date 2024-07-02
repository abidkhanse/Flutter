import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/list_tiles/profile_tile.dart';
import 'package:e_commerce/common/widgets/list_tiles/settings_menu_title.dart';
import 'package:e_commerce/common/widgets/primary_header_container.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold (

      body: SingleChildScrollView (
        child: Column(
          children: [
            PrimaryHeaderContainer (
              child: Column (

                children: [
                  ApplicationBar (
                    title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))
                  ),

                  TProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const Gap(TSizes.spaceBetweenSections * 2),
                ],
              )
            ),

            Padding (
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column (
                children: [

                  const SeactionHeading(title: 'Account setiings', textColor: TColors.black, showActionButton: false ),
                  const Gap(TSizes.spaceBetweenSections),
                  
                  TSettingsMenuTitle (icon: Iconsax.safe_home, title: 'My addresses', subTitle: 'Set shopping delivery address', onTap: () => Get.to(() => const UserAddressScreen())),
                  TSettingsMenuTitle (icon: Iconsax.shopping_cart, title: 'My cart', subTitle: 'Add/Remove products and move to checkout', onTap: (){}),
                  TSettingsMenuTitle (icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In Progress and Completed orders', onTap: (){} ),
                  TSettingsMenuTitle (icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account', onTap: (){} ),
                  TSettingsMenuTitle (icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons', onTap: (){} ),
                  TSettingsMenuTitle (icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message', onTap: (){} ),
                  TSettingsMenuTitle (icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts', onTap: (){} ),

                  const Gap(TSizes.spaceBetweenSections),
                  const SeactionHeading(title: 'Configuration', textColor: TColors.black, showActionButton: false ),

                  const Gap(TSizes.spaceBtwItems),
                  TSettingsMenuTitle (icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase', onTap: (){} ),
                  
                  TSettingsMenuTitle (
                    icon: Iconsax.location, 
                    title: 'Geolocation', 
                    subTitle: 'Set recommendation based on location', 
                    trailing: Switch(value: true, onChanged: (value) => {})
                  ),
                  
                  TSettingsMenuTitle (
                    icon: Iconsax.security_user, 
                    title: 'Safe Mode', 
                    subTitle: 'Search result is safe for all ages', 
                    trailing: Switch(value: false, onChanged: (value) => {})
                  ),

                  TSettingsMenuTitle (
                    icon: Iconsax.image, 
                    title: 'HD Image quality', 
                    subTitle: 'Set image quality to be seen', 
                    trailing: Switch(value: true, onChanged: (value) => {})
                  ),

                  const Gap (TSizes.spaceBetweenSections) ,
                  
                  SizedBox (
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () {}, child: const Text('Logout'),),
                  ),

                  const Gap(TSizes.spaceBetweenSections * 2.5),

                ],
              ),
            )
          ]
        )
      )
    );
  }
}
