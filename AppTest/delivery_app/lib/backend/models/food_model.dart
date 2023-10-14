import 'package:delivery_app/backend/repositories/generic/generic_entity.dart';

class Food extends GenericEntity {
  Food({required super.id});

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

List<Food> foods = [];
