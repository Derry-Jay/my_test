import '../utils/values.dart';

class Assets {
  static final Assets _singleton = Assets._internal();

  factory Assets() => _singleton;

  Assets._internal();

  final flashImage = '${acf.assetImagePath}flash.svg',
      bigImage = '${acf.assetImagePath}unsupported_device.svg';
}
