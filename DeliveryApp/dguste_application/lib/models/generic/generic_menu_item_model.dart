import 'package:dgust_aplication/controllers/general_id.dart';

abstract class GenericMenuItem with Identificable {
  int id;
  int categoryId;
  String classification;
  bool isAvailable;

  GenericMenuItem(
      {required this.id,
      required this.categoryId,
      required this.classification,
      required this.isAvailable});
}

abstract class DescriptableMenuItem extends GenericMenuItem {
  String description;

  DescriptableMenuItem(
      {required super.id,
      required super.categoryId,
      required super.classification,
      required super.isAvailable,
      required this.description});
}

abstract class NonDescriptableMenuItem extends GenericMenuItem {
  NonDescriptableMenuItem({
    required super.id,
    required super.categoryId,
    required super.classification,
    required super.isAvailable,
  });
}
