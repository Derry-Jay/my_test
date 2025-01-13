import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../utils/methods.dart';

class AppConfig {
  int buildNo = 0;
  String name = '',
      version = '',
      publishTo = '',
      sdkVersion = '',
      description = '',
      appIconAsset = '',
      assetImagePath = '';

  AppConfig();

  String get fullName =>
      ('name'.valFromConfig<String>() ?? name).split('_').map(toName).join(' ');

  AboutDialog getAboutDialog({Key? key, List<Widget>? children}) => AboutDialog(
      key: key,
      applicationName: fullName,
      applicationVersion: version,
      applicationLegalese: description,
      applicationIcon: appIconAsset.getImageFromAssetOrNetwork(),
      children: children);

  AppConfig.fromJson(Map<String, Object?> json) {
    try {
      // json.jot();
      (json['flutter'] as Map<String, Object?>? ?? <String, Object?>{}).jot();
      final List<String> vb = json['version'].string.split('+');
      version = vb.first;
      name = json['name'].string;
      buildNo = vb.last.toInt(null, 0);
      publishTo = json['publish_to'].string;
      description = json['description'].string;
      sdkVersion = (json['environment'] as Map<String, Object?>? ??
              <String, Object?>{})['sdk']
          .string;
      assetImagePath = List<String>.from(
              (json['flutter'] as Map<String, Object?>? ??
                      <String, Object?>{})['assets'] as Iterable? ??
                  const Iterable.empty())
          .firstWhere(isImagePath, orElse: emptyString);
      appIconAsset = (json['flutter_icons'] as Map<String, Object?>? ??
              <String, Object?>{})['image_path']
          .string;
    } catch (e) {
      e.jot();
    }
  }

  @override
  String toString() => '$fullName Version: $version Build No.: $buildNo';

  @override
  bool operator ==(Object other) =>
      other is AppConfig &&
      other.buildNo == buildNo &&
      other.version.trimmed == version.trimmed &&
      other.name.trimmed.lowerCased == name.trimmed.lowerCased;

  @override
  // TODO: implement hashCode
  int get hashCode => name.hashCode + version.hashCode + buildNo.hashCode;
}
