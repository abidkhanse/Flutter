import 'package:first_flutter_project/utils/app_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../utils/app_styles.dart';

class ColumnRow extends StatelessWidget {

  final String firstText;
  final String secondText;
  final CrossAxisAlignment alignment;

  const ColumnRow(this.firstText, this.secondText, this.alignment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: alignment,
      children: [
        Text(firstText, style: const TextStyle(fontSize: 16, color: Colors.black87 )),
        Gap(AppLayout.getHeight(5, context)),
        Text(secondText, style: Styles.headlineStyle4,),
      ],
    );
  }

}
