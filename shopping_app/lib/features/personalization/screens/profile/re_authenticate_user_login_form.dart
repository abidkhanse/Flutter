import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                controller: controller.verifyEmail,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const Gap(TSizes.spaceBtwInputFields),
              Obx(
                () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        TValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye),
                        ))),
              ),
              const Gap(TSizes.spaceBtwInputFields),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.reAuthEmailAndPasswordUser(),
                    child: const Text('Verify')),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
