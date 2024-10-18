import 'package:geocoding/geocoding.dart';

class MyGeocoder extends GeocodingPlatform {
  static final MyGeocoder _singleton = MyGeocoder._internal();

  factory MyGeocoder() => _singleton;

  MyGeocoder._internal();

  Future<bool> get isThere => isPresent();
}
