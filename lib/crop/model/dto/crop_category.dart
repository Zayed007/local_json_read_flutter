import 'crops.dart';

/// id : 1
/// name : "danadar"
/// crops : [{"id":1,"name":"Dhan","icon_link":"www.icon.com"},{"id":2,"name":"Gom","icon_link":"www.icon.com"},{"id":3,"name":"Vutta","icon_link":"www.icon.com"}]

class CropCategory {
  int id;
  String name;
  List<Crop> crops;

  CropCategory({this.id, this.name, this.crops});

  CropCategory.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    if (json["crops"] != null) {
      crops = [];
      json["crops"].forEach((v) {
        crops.add(Crop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    if (crops != null) {
      map["crops"] = crops.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
