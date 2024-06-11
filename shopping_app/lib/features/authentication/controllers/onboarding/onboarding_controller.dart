import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when page scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  /// Jump to the specified dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update current index and jump to next page
  void nextPage() {

    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
      //
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update current Index and jump tp the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
