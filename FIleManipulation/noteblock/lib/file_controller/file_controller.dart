import 'dart:convert';
import 'dart:io';

import 'package:noteblock/ads/ad.dart';
import 'package:path_provider/path_provider.dart';

class FilePersistence {
  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    String localPath = directory.path;
    return File('$localPath/taskFile.json');
  }

  Future<bool> saveData(List<Ad> ads) async {
    final localFile = await _getLocalFile();
    List mapAds = List.empty(growable: true);
    for (Ad ad in ads) {
      mapAds.add(ad.toMap());
    }
    String data = json.encode(mapAds);
    if (localFile.writeAsString(data) != null) return true;
    return false;
  }

  Future<List<Ad>> getData() async {
    final localFile = await _getLocalFile();
    List mapAds = List.empty(growable: true);
    List<Ad> tasks = List<Ad>.empty(growable: true);

    String data = await localFile.readAsString();
    mapAds = json.decode(data);

    for (var mapAd in mapAds) {
      tasks.add(Ad.fromMap(mapAd));
    }

    return tasks;
  }
}
