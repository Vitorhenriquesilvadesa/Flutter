/*
 Não podera Extender de GenericModel devido seu id ser uma String, discutir solução com vitim!
 */

import '../../controllers/general_id.dart';

class EdgeModel with Identificable {
  late final String id; //PrimaryKey
  late final int categoryId;
  late final String name;
  late final double price;

  EdgeModel(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.price});

  static List<EdgeModel> edges = [
    EdgeModel(
      id: "Chedar_M",
      categoryId: 1,
      name: "Cheddar",
      price: 5.00,
    ),
    EdgeModel(
      id: "Chocolate_G",
      categoryId: 1,
      name: "Chocolate",
      price: 4.00,
    ),
    EdgeModel(
      id: "Chocolate_B",
      categoryId: 1,
      name: "Chocolate",
      price: 5.00,
    ),
    EdgeModel(
      id: "Chocolate_P",
      categoryId: 1,
      name: "Chocolate Branco",
      price: 6.00,
    )
  ];
}
