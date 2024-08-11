import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/controllers/connectivity/network_manager.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_MY_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_MY_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      LoadingDialog.show();
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        LoadingDialog.hide();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        LoadingDialog.hide();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_MY_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_MY_PASSWORD', password.text.trim());
      }

      final result = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      LoadingDialog.hide();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      LoadingDialog.hide();
      Loaders.errorSnackBar(title: 'Oh..', message: e.toString());
    }
  }

  Future<void> googleSignin() async {
    try {
      //LoadingDialog.show();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LoadingDialog.hide();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      // LoadingDialog.hide();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      LoadingDialog.hide();
      Loaders.errorSnackBar(title: 'Oh..', message: e.toString());
    }
  }
}
