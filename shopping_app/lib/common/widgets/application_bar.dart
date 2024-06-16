import 'package:e_commerce/common/widgets/cart_counter_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar(
      {super.key,
      this.title,
      this.leadingIcon,
      this.actions,
      this.showBackArrorw = false,
      this.onBackPressed});

  final Widget? title;
  final bool showBackArrorw;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrorw
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Iconsax.arrow_left))
              : leadingIcon != null
                  ? IconButton(
                      onPressed: onBackPressed, icon: Icon(leadingIcon))
                  : null,
          title: title,
          actions: [
            CartCounterIcon(
              onPressed: () {},
              iconColor: TColors.white,
              count: '10',
            ),
          ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
}
