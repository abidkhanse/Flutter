
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ShadowStyle {

  static final verticalProductShadow = BoxShadow (

    color: TColors.darkGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 10,
    offset: const Offset(0, 2),

  );


  static final horizontalProductShadow = BoxShadow (

    color: TColors.darkGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 10,
    offset: const Offset(0, 2),

  );




}