import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/cart_counter_icon.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.message,
    required this.name,
  });

  final String message;
  final String name;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return ApplicationBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Obx(
            () => Text(controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.white)),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(onPressed: () {}, count: '10', iconColor: TColors.white)
      ],
    );
  }
}
