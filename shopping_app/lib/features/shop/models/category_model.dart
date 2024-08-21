import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  static String ID = "id";
  static String NAME = 'Name';
  static String IMAGE = 'Image';
  static String ISFEATURED = 'IsFeatured';
  static String PARENTID = 'ParentId';

  String id;
  String name;
  String image;
  String parentID;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentID = '',
  });

  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      NAME: name,
      IMAGE: image,
      ISFEATURED: isFeatured,
      PARENTID: parentID,
    };
  }

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return CategoryModel(
        id: '',
        name: data[NAME] ?? '',
        image: data[IMAGE] ?? '',
        parentID: data[PARENTID] ?? '',
        isFeatured: data[ISFEATURED] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
