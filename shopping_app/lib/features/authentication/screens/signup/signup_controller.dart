import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
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
      FullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.productImage_1);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy policy
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: 'Privacy Policy',
          message: 'You must agree to our privacy policy',
        );
        return;
      }

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
      userRepository.save(newUser);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      FullScreenLoader.closeLoadingDialog();
    }
  }
}
