import 'dart:convert';

import 'package:flutter_app_local_json_load/crop/model/dto/crop_category.dart';
import 'package:flutter/services.dart' show rootBundle;


class CropProvider{
  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/json/crops.json');
  }

  Future<List<CropCategory>> loadCropsCategory() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    return (jsonResponse as List)
        .map((cropCategory) => CropCategory.fromJson(cropCategory))
        .toList();
  }
}