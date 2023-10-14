// abstract class GenericMenuItem with Identificable {
//   int id;
//   int categoryId;
//   String classification;
//   bool isAvailable;

//   GenericMenuItem(
//       {required this.id,
//       required this.categoryId,
//       required this.classification,
//       required this.isAvailable});
// }

/*
 MenuItem Se tornou redundante, todas as carateristicas que DescriptableMenuItem 
 e NonDescriptableMenuItem tinha em comum foram delegadas para GenericModel   
 Depois discutir o uso do IsAvailable, por enquanto vou remove-los.

 perceba que variation pode facilmente ser equivalente a name de GenericModel
 depois descutir nomes das variaveis
*/

import 'generic_model.dart';

abstract class DescriptableMenuItemModel extends GenericModel {
  String description;

  DescriptableMenuItemModel(
      {required super.id,
      required super.categoryId,
      // required super.isAvailable,
      required this.description,
      required variation})
      : super(name: variation); // atribuindo variation em name
}

abstract class NonDescriptableMenuItemModel extends GenericModel {
  NonDescriptableMenuItemModel({
    required super.id,
    required super.categoryId,
    required variation,
    // required super.isAvailable,
  }) : super(name: variation); // atribuindo variation em name
}
