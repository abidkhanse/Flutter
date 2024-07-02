import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold (
        appBar: const ApplicationBar (showBackArrorw: true, title: Text('Add new address')),
        body: SingleChildScrollView (
          child: Padding (
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name',
                ),
              ),
              const Gap(TSizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Phone Number',
                ),
              ),
              const Gap(TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building_3),
                        labelText: 'Street',
                      ),
                    ),
                  ),
                  const Gap(TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: 'Postal Code',
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: 'City',
                      ),
                    ),
                  ),
                  const Gap(TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: 'State',
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(TSizes.spaceBtwInputFields),
              TextFormField (
                decoration: const InputDecoration (
                  prefixIcon: Icon(Iconsax.activity),
                  labelText: 'State',
                ),
              ),
              const Gap(TSizes.spaceBtwInputFields),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Save'),),)
            ]),
          ),
        )));
  }
}

