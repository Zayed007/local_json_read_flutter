import 'package:flutter/material.dart';
import 'package:flutter_app_local_json_load/crop/bloc/crop_bloc.dart';
import 'package:flutter_app_local_json_load/crop/model/dto/crop_category.dart';
import 'package:flutter_app_local_json_load/crop/model/dto/crops.dart';

class CropsPage extends StatefulWidget {
  @override
  _CropsPageState createState() => _CropsPageState();
}

class _CropsPageState extends State<CropsPage> {
  CropBloc _cropBloc;

  @override
  void initState() {
    _cropBloc = CropBloc();
    _cropBloc.getCrops();
    super.initState();
  }

  @override
  void dispose() {
    _cropBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop'),
      ),
      body: Container(
        height: double.infinity,
        child: StreamBuilder<List<CropCategory>>(
            stream: _cropBloc.cropsCategoryListener,
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                return _cropCategoryWidget(snapshot.data);
              } else
                return Text('no data found');
            }),
      ),
    );
  }

  Widget _cropCategoryWidget(List<CropCategory> cropCategories) {
    return Column(
      children: [
        ...cropCategories.map((cropCategory) =>
            Column(
              children: [
                Text(
                  cropCategory.name,
                  style: TextStyle(color: Colors.red),
                ),
                _cropWidget(cropCategory.crops),
              ],
            )
        ).toList(),
      ],
    );
  }
}

Widget _cropWidget(List<Crop> crops) {
  return Column(
    children: [
      ...crops
          .map((crop) =>
          Text(
            crop.name,
            style: TextStyle(color: Colors.green),
          ))
          .toList(),
    ],
  );
}
