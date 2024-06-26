import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import 'widget/profile_menu.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: const ApplicationBar ( title: Text('Profile'), showBackArrorw: true),
      
      body: SingleChildScrollView (
        child: Padding (
      
          padding: const EdgeInsets.all(TSizes.defaultSpace),    

          child: Column (
            children: [
              SizedBox (
                width: double.infinity,
                child: Column (
                  children: [
                    const CircularImage(image: TImages.userIcon, width: 80, height: 80, backgroundColor: TColors.darkGrey),
                    TextButton(onPressed: () {}, child: const Text('Change Profile picture')),
                  ]
                ),
              ),

              const Gap(TSizes.spaceBtwItems / 2),
              const Divider(),
              const Gap(TSizes.spaceBtwItems),
              const SeactionHeading(title: 'Profile information', showActionButton: false, textColor: TColors.black,),
              const Gap(TSizes.spaceBtwItems / 2),

              TProfileMenu(title: 'Name', value: 'Coding with khan', onPressed: () { },),
              TProfileMenu(title: 'Username', value: 'Coding with khan', onPressed: () { },),

              const Gap(TSizes.spaceBtwItems / 2),
              const Divider(),
              const Gap(TSizes.spaceBtwItems),

              const SeactionHeading(title: 'Personal Information', showActionButton: false, textColor: TColors.black,),
              const Gap(TSizes.spaceBtwItems),
              TProfileMenu(title: 'User ID', value: '1234', icon: Iconsax.copy, onPressed: () { },),
              TProfileMenu(title: 'E-Mail', value: 'khan@user.com', onPressed: () { },),
              TProfileMenu(title: 'Phone numner', value: '+92-317-12341234', onPressed: () { },),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () { },),
              TProfileMenu(title: 'Date of birth', value: 'December 20, 1986', onPressed: () { },),

              const Divider(),
              const Gap(TSizes.spaceBtwItems),

              Center (
                child: TextButton(onPressed: () {}, child: const Text('Close Account', style: TextStyle(color: TColors.error)))
              )
            ],
          ),
        ),
      ),
    );
  }
}
