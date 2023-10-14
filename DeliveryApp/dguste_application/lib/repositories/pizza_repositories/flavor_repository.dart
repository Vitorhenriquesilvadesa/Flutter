import 'package:flutter/foundation.dart';

import '../../models/pizza_parts_models/flavor_model.dart';
import '../generic/generic_repository.dart';

class FlavorRepository extends GenericRepository<FlavorModel> {
  FlavorRepository()
      : super.setList(
          testList: FlavorModel.flavors,
        );
}

void main(List<String> args) {
  FlavorRepository rep = FlavorRepository();
  debugPrint(rep.listAll().toString());
  debugPrint(rep.getByCategoryId(1).toString());
  debugPrint(rep.getById(2).description.toString());
}
