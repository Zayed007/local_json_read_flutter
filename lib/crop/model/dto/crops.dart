/// id : 1
/// name : "Dhan"
/// icon_link : "www.icon.com"

class Crop {
  int id;
  String name;
  String iconLink;

  Crop({
      this.id, 
      this.name, 
      this.iconLink});

  Crop.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    iconLink = json["icon_link"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["icon_link"] = iconLink;
    return map;
  }

}