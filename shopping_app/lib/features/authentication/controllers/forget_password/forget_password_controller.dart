import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/controllers/connectivity/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  final email = TextEditingController();

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordToResetEmail() async {
    try {
      LoadingDialog.show();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LoadingDialog.hide();
        return;
      }

      if (!forgetPasswordFormKey.currentState!.validate()) {
        LoadingDialog.hide();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordToResetEmail(email.text.trim());
      LoadingDialog.hide();
      Loaders.successSnackBar(
          title: 'E-mail send',
          message: 'Email Link Sent to Reset Password'.tr);

      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      LoadingDialog.hide();
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  resendPasswordToResetEmail(String email) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LoadingDialog.hide();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordToResetEmail(email);
      Loaders.successSnackBar(
          title: 'E-mail send',
          message: 'Email Link Sent to Reset Password'.tr);
    } catch (e) {
      LoadingDialog.hide();
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
