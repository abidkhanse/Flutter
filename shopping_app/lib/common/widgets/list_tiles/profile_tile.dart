
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../images/circular_image.dart';

class TProfileTile extends StatelessWidget {
  const TProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile (
     leading: const CircularImage(image: TImages.userIcon, width: 50, height: 50, padding: 0),
     title: Text('Abid Khan', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
     subtitle : Text('support@khan.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
     trailing: IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit, color: TColors.white))
                      );
  }
}