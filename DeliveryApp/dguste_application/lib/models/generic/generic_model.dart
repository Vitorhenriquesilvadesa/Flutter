/*
 Essa classe vai definir os atributos base de qualquer model 
 importante pos como a classe generica implementa do Repository se tipado, a classe de tipagem devera extendela   
*/

import '../../controllers/general_id.dart';

class GenericModel with Identificable {
  int id;
  String name;

  // creio que categoryId sera retirado no futuro, mas por enquanto e importante para o funcionamento da simulação de banco de dados
  int categoryId;

  GenericModel({
    required this.id,
    required this.name,
    required this.categoryId,
  });
}
