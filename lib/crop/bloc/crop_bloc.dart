import 'dart:async';

import 'package:flutter_app_local_json_load/crop/model/dto/crop_category.dart';
import 'package:flutter_app_local_json_load/crop/model/repository/crop_repository.dart';

class CropBloc {
  var _cropRepository = CropRepository();

  StreamController<List<CropCategory>> _cropsCategoryStreamController =
      StreamController<List<CropCategory>>.broadcast();

  Stream<List<CropCategory>> get cropsCategoryListener =>
      _cropsCategoryStreamController.stream;

  Sink<List<CropCategory>> get _cropsCategoryIn =>
      _cropsCategoryStreamController.sink;

  getCrops() async {
    print('Getting crops from json file');
    await _cropRepository.loadCropsCategory().then((value) {
      print('crops loaded from json success');
      _cropsCategoryIn.add(value);
    }).catchError((onError) =>
        print('Failed to load crops from json.\nreason: $onError'));
  }

  dispose() {
    _cropsCategoryStreamController.close();
  }
}
