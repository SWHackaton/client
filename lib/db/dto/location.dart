const String tableGeo = 'geolocations';
const String columnId = '_id';
const String columnDateTime = 'dateTime';
const String columnLat = 'latitude';
const String columnLon = 'longitude';

class GeoLocation {
  late int? id;
  late String dateTime;
  late double latitude;
  late double longitude;

  GeoLocation({required this.dateTime,required this.latitude, required this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  GeoLocation.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    dateTime = map[columnDateTime];
    latitude = map[columnLat];
    longitude = map[columnLon];
  }
}