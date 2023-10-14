import 'package:noteblock/ads/ad.dart';

abstract class IAd {
  Future<Ad?> save(Ad ad);
  Future<List<Ad>> getAll();
  Future<Ad?> getById(int id);
  Future<int?> edit(Ad ad);
  Future<int?> delete(Ad ad);
}
