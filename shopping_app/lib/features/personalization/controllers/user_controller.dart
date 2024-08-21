import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/controllers/connectivity/network_manager.dart';
import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../authentication/models/user_model.dart';
import '../screens/profile/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

// Check why it cannot save the user details
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final userName =
              UserModel.generateUserName(userCredentials.user!.displayName);

          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              userName: userName,
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profileImage: userCredentials.user!.photoURL?.toString() ?? '');

          await userRepository.save(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: 'Date not saved',
          message:
              'Something went wrong while saving the user info, please try again in your profile.');
    }
  }

  Future<void> reAuthEmailAndPasswordUser() async {
    try {
      LoadingDialog.show();
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LoadingDialog.hide();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        LoadingDialog.hide();
        return;
      }

      await AuthenticationRepository.instance.reAuthWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      LoadingDialog.hide();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      LoadingDialog.hide();
      Loaders.errorSnackBar(title: 'Oh..', message: e.toString());
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete this account, action is not reverable!',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: TColors.red,
            side: const BorderSide(color: TColors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete')),
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')),
    );
  }

  void deleteUserAccount() async {
    try {
      LoadingDialog.show();
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        LoadingDialog.hide();
        return;
      }

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          LoadingDialog.hide();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          LoadingDialog.hide();
          Get.to(() => const ReAuthenticateUserLoginForm());
        }
      } else {
        LoadingDialog.hide();
        Loaders.errorSnackBar(
            title: 'Error',
            message:
                'No account associated with this device, unable to delete the account.');
      }
    } catch (e) {
      LoadingDialog.hide();
      Loaders.errorSnackBar(title: 'Oh..', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);
        Map<String, dynamic> json = {'profileImage': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profileImage = imageUrl;
        user.refresh();
        Loaders.successSnackBar(
            title: 'Success..', message: 'Image has been uploaded');
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh..', message: 'Unable to upload image');
    }
  }
}
