import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/connectivity/network_manager.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final userNameController = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  signup() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        LoadingDialog.hide();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        LoadingDialog.hide();
        return;
      }

      // Privacy policy
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: 'Privacy Policy',
          message: 'You must agree to our privacy policy',
        );
        return;
      }

      LoadingDialog.show();
      //'We are processing your information', TImages.onRegisteration);

      final credentials = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim());

      final newUser = UserModel(
        id: credentials.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        userName: userNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        profileImage: '',
      );

      final userRepository = Get.put(UserRepository());

      await userRepository.save(newUser);

      LoadingDialog.hide();

      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been successfully created.');

      Get.to(() => const VerifyEmail());
    } catch (e) {
      LoadingDialog.hide();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
