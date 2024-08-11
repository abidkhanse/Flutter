import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../images/circular_image.dart';

class TProfileTile extends StatelessWidget {
  const TProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
        leading: const CircularImage(
            image: TImages.userIcon, width: 50, height: 50, padding: 0),
        title: Obx(
          () => Text(controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white)),
        ),
        subtitle: Text(controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white)),
        trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(Iconsax.edit, color: TColors.white)));
  }
}
