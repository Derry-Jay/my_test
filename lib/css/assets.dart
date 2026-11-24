import 'package:common_utils/common_utils.dart';


class Assets {
  static final Assets _singleton = Assets._internal();

  factory Assets() => _singleton;

  Assets._internal();

  final String tick = '${acf.assetImagePath}Path.svg',
      flashImage = '${acf.assetImagePath}flash.svg',
      exitFlow = '${acf.assetImagePath}Exitflow.svg',
      paperClip = '${acf.assetImagePath}paperclip-2.svg',
      bigImage = '${acf.assetImagePath}unsupported_device.svg';
}
