import 'package:dgust_aplication/controllers/general_id.dart';

class Flavor with Identificable {
  final int id;
  final int categoryId;
  final String name;
  final String description;

  Flavor({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
  });

  static List<Flavor> flavors = [
    Flavor(
        id: 1,
        categoryId: 1,
        name: "Calabresa",
        description: "Mussarela e calabresa"),
    Flavor(
        id: 2,
        categoryId: 1,
        name: "Marguerita",
        description: "Mussarela e tomate"),
  ];
}
