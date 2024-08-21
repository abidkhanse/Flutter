import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exception.dart';
import 'package:e_commerce/utils/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static String CATEGORIES = 'Categories';
  static CategoryRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection(CATEGORIES).get();
      return snapshot.docs
          .map((doc) => CategoryModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
      throw Exception('An unexpected error occurred, try again later');
    }
  }
}
