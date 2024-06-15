import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/home/home.dart';
import 'utils/constants/colors.dart';

class ApplicationNavigationBar extends StatelessWidget {
  const ApplicationNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDark = THelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: isDark ? Colors.black : Colors.white,
          indicatorColor: isDark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Search'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Settings'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    /*
      const HomeScreen(),
      const SearchScreen(),
      const SettingsScreen(),
      const ProfileScreen(),
    */
    const HomeScreen(),
    Container(color: TColors.grey),
    Container(color: Colors.green),
    Container(color: Colors.red),
  ].obs;
}
