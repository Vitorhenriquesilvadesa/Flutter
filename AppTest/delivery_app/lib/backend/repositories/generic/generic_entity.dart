import 'dart:convert';

import 'package:delivery_app/backend/repositories/ids/generic_id.dart';

abstract class GenericEntity {
  GenericID id;

  GenericEntity({required this.id});

  Map<String, dynamic> toMap();

  GenericEntity.fromId(this.id);

  String toJson(Map<String, dynamic> data) {
    return jsonEncode(data);
  }

  Map<String, dynamic> fromJson(String json) {
    return jsonDecode(json);
  }
}
