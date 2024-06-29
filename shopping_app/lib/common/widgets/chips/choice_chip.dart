import 'package:e_commerce/common/widgets/circular_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip (
    {
      super.key, 
      required this.text, 
      required this.selected, 
      this.onSelected
    }
  );

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {

    final isColor = THelperFunction.getColor(text) != null;

    return ChoiceChip (

        label:      isColor ? const SizedBox() : Text(text),
        selected:   selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar:     isColor ? TCircularContainer(width: 50, height: 50, backgroundColor: THelperFunction.getColor(text)!) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding:    isColor ? const EdgeInsets.all(0) : null,
        shape:      isColor ? const CircleBorder() : null, 
        backgroundColor: isColor ? THelperFunction.getColor(text)! : null,
      
      );
  }
}
