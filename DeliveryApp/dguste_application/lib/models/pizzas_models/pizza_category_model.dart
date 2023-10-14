/*
 PizzaCategoryModel não tem nenhuma diferença de GenericCategory, 
 na verdade agora nenhuma categoria, tera diferença, a não ser que depois talvez dividir em discritable e nondiscritable,
 mas por enquanto vamos mante-la para diferençar-los, alem disso facilitar posteriormente o uso dos controllers
 mas futuramente ver a possibilidade de retira-lo 
*/

import '../generic/generic_category_model.dart';

class PizzaCategoryModel extends GenericCategoryModel {
  PizzaCategoryModel(
      {required super.id, required super.name, required super.description})
      : super(categoryId: id); // corrigindo a questão do categoryId

  static List<PizzaCategoryModel> categories = [
    PizzaCategoryModel(
      id: 1,
      name: "Pizzas de Sal",
      description: "Pizzas Personalizavel de 4, 6, 8 e 10",
    ),
    PizzaCategoryModel(
      id: 2,
      name: "Pizzas de Doce",
      description: "Pizzas de Doce brotinho e pequena",
    )
  ];
}
