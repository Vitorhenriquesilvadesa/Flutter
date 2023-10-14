/*
  vale lembrar GeneralProductCategoryModel não tem nenhuma diferença de GenericCategoryModel
  detalhei melhor isso em PizzaCategoryModel 
*/

import '../generic/generic_category_model.dart';

class GeneralProductCategoryModel extends GenericCategoryModel {
  GeneralProductCategoryModel(
      {required super.id, required super.name, required super.description})
      : super(categoryId: id); // corigindo a questão categoryId

  static List<GeneralProductCategoryModel> categories = [
    GeneralProductCategoryModel(
      id: 3,
      name: "Categoria Geral 1",
      description: "Essa e uma categoria geral",
    )
  ];
}
