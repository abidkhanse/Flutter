import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SeactionHeading extends StatelessWidget {
  const SeactionHeading(
      {super.key,
      required this.title,
      this.buttonTitle = 'View all',
      this.textColor = TColors.white,
      this.showActionButton = true,
      this.onPressed
    });

  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    
    return Row (

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
      children: [
        
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
