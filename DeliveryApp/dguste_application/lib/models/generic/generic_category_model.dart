import 'package:dgust_aplication/models/generic/generic_model.dart';

abstract class GenericCategoryModel extends GenericModel {
  // late Image image;

  late final String description;

  GenericCategoryModel(
      {required super.id,
      required super.name,
      required super.categoryId,
      required this.description});
}
