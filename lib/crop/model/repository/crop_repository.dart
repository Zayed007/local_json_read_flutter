import 'package:flutter_app_local_json_load/crop/model/dto/crop_category.dart';
import 'package:flutter_app_local_json_load/crop/model/provider/crop_provider.dart';

class CropRepository {
  var _cropProvider = CropProvider();

  Future<List<CropCategory>> loadCropsCategory() => _cropProvider.loadCropsCategory();
}
