import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/categories/category_repository.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class CategoryConroller extends GetxController {
  static CategoryConroller get instance => Get.find();

  final isLoading = false.obs;

  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategoies = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCatgories();
    super.onInit();
  }

  Future<void> fetchCatgories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategoies.value = categories
          .where(
              (category) => category.isFeatured && category.parentID != "none")
          .take(8)
          .toList();
    } catch (error) {
      Loaders.errorSnackBar(title: 'Ooops!', message: error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
