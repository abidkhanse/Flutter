
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {

        final isDark = THelperFunction.isDarkMode(context);

    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: isDark ? TColors.darkerGrey : TColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(text.capitalize!, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: isDark ? TColors.darkerGrey : TColors.grey, thickness: 0.5, indent: 5, endIndent: 60))
      ],
    );
  }
}

