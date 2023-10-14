import 'package:flutter/foundation.dart';

import '../generic/generic_model.dart';

class FlavorModel extends GenericModel {
  late final String description;

  FlavorModel({
    required this.description,
    required super.id,
    required super.name,
    required super.categoryId,
  });

  static List<FlavorModel> flavors = [
    FlavorModel(
      id: 1,
      categoryId: 1,
      name: "Calabresa",
      description: "Mussarela e calabresa",
    ),
    FlavorModel(
      id: 2,
      categoryId: 1,
      name: "Marguerita",
      description: "Mussarela e tomate",
    ),
  ];
}

void main(List<String> args) {
  debugPrint(FlavorModel.flavors.toString());
}
