import 'package:dgust_aplication/models/pizzas_models/pizza_category_model.dart';
import 'package:dgust_aplication/repositories/generic/generic_repository.dart';

class PizzaCategoryRepository extends GenericRepository<PizzaCategoryModel> {
  PizzaCategoryRepository()
      : super.setList(
          testList: PizzaCategoryModel.categories,
        );
}
