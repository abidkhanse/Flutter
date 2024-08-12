import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/controllers/connectivity/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_controller.dart';
import '../../profile/profile.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instace => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initilizeNames();
    super.onInit();
  }

  Future<void> initilizeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      LoadingDialog.show();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LoadingDialog.hide();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        LoadingDialog.hide();
        return;
      }

      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      LoadingDialog.hide();

      Loaders.successSnackBar(
          title: 'Congratulations!',
          message: 'you have successfully updated your name');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      LoadingDialog.hide();
      Loaders.errorSnackBar(title: 'Oh...', message: e.toString());
    }
  }
}
