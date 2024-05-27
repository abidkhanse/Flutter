import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class DoubleTextWidget extends StatelessWidget {

  String text1;
  String text2;

  DoubleTextWidget(this.text1, this.text2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: Styles.headlineStyle2,),
        InkWell (
          onTap: () { print("view all " );
          },
          child: Text(text2, style: Styles.textStyle.copyWith(color: Styles.primaryColor),),
        ),
      ],
    );
  }
}
