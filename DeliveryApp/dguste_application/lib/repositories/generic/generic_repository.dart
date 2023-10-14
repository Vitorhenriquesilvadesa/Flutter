// Esta classe Sera responsavel por tentar generlizar o maximo possivel as operações do banco de dados, como:
//ListALl, getByIdCategory, getById
//Operações de delete não estarão presentes, ja que apenas classes como a do carrinho ou a do pedido que tera esssa cacteristica
// Operações de update não estarão presentes pois apenas classes como usuario, carrinho e pedido tera essa caracteristica
// Ainda não foi escolhido o banco que sera usado, mesmo assim e possivel generalizar esses operações

import 'package:dgust_aplication/models/generic/generic_model.dart';

mixin ListAll<T extends GenericModel> {
  List<T> listAll();
}

class GenericRepository<T extends GenericModel> with ListAll {
  late String tableName;

  //atributo que pegar uma lista estatica da subclasse, apenas para simular as operações de banco de dados
  late List<T> testList;

  //Esse metodo não e aplicavel apenas pesando em implementações futuras, onde se precisa do nome da tabela para exevutar as operações
  GenericRepository.future({required this.tableName});
  // Esse me metodo e temporario, apenas receber uma lista de acordo com a subclasse para simulações de banco.
  GenericRepository.setList({required this.testList});

  @override
  List<T> listAll() {
    return this.testList;
  }

  List<T> getByCategoryId(int categoryId) {
    return this
        .testList
        .where((model) => model.categoryId == categoryId)
        .toList();
  }

  T getById(int id) {
    return this.testList.firstWhere((model) => model.id == id);
  }
}
