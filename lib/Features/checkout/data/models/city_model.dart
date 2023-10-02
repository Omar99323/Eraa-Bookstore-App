class CityModel {
  int? id;
  String? name;
  CityModel({this.id, this.name});
  CityModel.fromjson(data) {
    id = data['id'];
    name = data['governorate_name_en'];
  }
}
