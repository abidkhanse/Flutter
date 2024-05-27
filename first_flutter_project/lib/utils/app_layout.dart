import 'package:flutter/cupertino.dart';

class AppLayout {

  static getScreenSize(BuildContext context) {
    return SizedBox (
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }

  static getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(double pixel, BuildContext context) {
    double screenHeight = getScreenSize(context).height;
    double x = screenHeight / pixel;
    return screenHeight / x;
  }

  static getWidth(double pixel, BuildContext context) {
    double screenWidth = getScreenSize(context).width;
    double x = screenWidth / pixel;
    return screenWidth / x;
  }

}