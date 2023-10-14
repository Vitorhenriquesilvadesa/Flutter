import '../generic/generic_category_model.dart';
/*
  vale lembrar DrinkCategoryModel não tem nenhuma diferença de GenericCategoryModel
  detalhei melhor isso em PizzaCategoryModel 
*/

class DrinkCategoryModel extends GenericCategoryModel {
  DrinkCategoryModel(
      {required super.id, required super.name, required super.description})
      : super(categoryId: id); // corigindo a questão categoryId

  static List<DrinkCategoryModel> categories = [
    DrinkCategoryModel(
      id: 4,
      name: "Coca cola",
      description: "",
    )
  ];
}
