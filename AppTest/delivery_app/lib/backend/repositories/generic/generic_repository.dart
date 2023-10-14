import 'package:delivery_app/backend/repositories/generic/generic_entity.dart';
import 'package:delivery_app/backend/repositories/ids/generic_id.dart';

mixin IRepositoryBase<TEntity extends GenericEntity> {
  List<TEntity> getAll();

  List<TEntity> getFiltered(bool Function(TEntity) filter);

  TEntity? getById(GenericID id);

  TEntity add(TEntity entity);

  TEntity remove(TEntity entity);

  TEntity? removeById(GenericID id);
}

class RepositoryBase<TEntity extends GenericEntity>
    with IRepositoryBase<TEntity> {
  List<TEntity> entities;

  RepositoryBase({required this.entities});

  @override
  TEntity add(TEntity entity) {
    entities.add(entity);
    return entity;
  }

  @override
  List<TEntity> getAll() {
    return this.entities;
  }

  @override
  TEntity? getById(GenericID id) {
    TEntity entity = entities.firstWhere((item) => item.id == id);
    return entity;
  }

  @override
  List<TEntity> getFiltered(bool Function(TEntity entity) filter) {
    return entities.where(filter).toList();
  }

  @override
  TEntity remove(TEntity entity) {
    entities.remove(entity);
    return entity;
  }

  @override
  TEntity? removeById(GenericID id) {
    TEntity? entity = getById(id);
    entities.remove(entity);

    return entity;
  }
}
