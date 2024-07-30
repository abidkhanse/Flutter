import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore firestoreDB = FirebaseFirestore.instance;

  Future<void> save(UserModel model) async {
    try {
      await firestoreDB.collection("Users").doc(model.id).set(model.toJson());
    } on FirebaseException catch (e) {
      throw 'FirebaseException(e.code).message';
    } on FormatException catch (_) {
      throw 'FormatException(e.code).message';
    } on PlatformException catch (e) {
      throw 'PlatformException(e.code).message';
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
