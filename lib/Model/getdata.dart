

class DynamicDataModel {
  String key;
  String? icao;
  String? iata;
  String? name;
  String? city;
  String? state;
  String? country;
 var elevation;
 var lat;
 var lon;
  String? tz;


  DynamicDataModel({required this.key, required this.icao,
  this.name,this.country,this.state,this.city,this.elevation,this.iata,this.lat,this.lon,this.tz});
}
