import 'package:flutter/material.dart';

import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key, required this.topSpace, required this.rightSpace,
  });

  final double topSpace, rightSpace;

  @override
  Widget build(BuildContext context) {

    return Positioned(
        top: topSpace,
        right: rightSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('skip'),
        ));
  }
}