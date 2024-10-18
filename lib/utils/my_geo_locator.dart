import 'package:geolocator/geolocator.dart';

class MyGeoLocator extends GeolocatorPlatform {
  static final MyGeoLocator _singleton = MyGeoLocator._internal();

  factory MyGeoLocator() => _singleton;

  MyGeoLocator._internal();

  Future<bool> get appSettingsOpened => openAppSettings();

  Future<LocationPermission> get permission => checkPermission();

  Future<bool> get locationSettingOpened => openLocationSettings();

  Future<bool> get isLocationEnabled => isLocationServiceEnabled();

  Stream<ServiceStatus> get serviceStatus => getServiceStatusStream();

  Future<LocationPermission> get requestedPermission => requestPermission();

  Stream<Position> getPosition([LocationSettings? locationSettings]) =>
      getPositionStream(locationSettings: locationSettings);
}
