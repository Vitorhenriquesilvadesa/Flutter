import 'package:delivery_app/backend/repositories/generic/generic_entity.dart';

class Pizza extends GenericEntity {
  Pizza({required super.id});

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

List<Pizza> pizzas = [];
