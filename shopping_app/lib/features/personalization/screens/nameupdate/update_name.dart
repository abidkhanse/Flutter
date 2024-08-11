import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'widget/update_name_controller.dart';

class UpdateName extends StatelessWidget {
  const UpdateName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
        appBar: ApplicationBar(
          showBackArrorw: true,
          title: Text('Update Name',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'User name for easy verification, this name will appear in several places',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Gap(TSizes.spaceBetweenSections),
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(children: [
                  TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user))),
                  const Gap(TSizes.spaceBetweenSections),
                  TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          TValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user))),
                ])),
            const Gap(TSizes.spaceBetweenSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: const Text('Save')))
          ]),
        ));
  }
}
