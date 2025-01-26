import 'dart:io';

import 'package:flutter/material.dart';

import 'package:common_utils/common_utils.dart';
import 'my_app.dart';

void main() async {
  try {
    wb = WidgetsFlutterBinding.ensureInitialized();
    gc = await 'config'.configFromAsset;
    HttpOverrides.global = CustomHttp();
    acf = ((((await 'pubspec.yaml'.loadFromAssets()).getFromYAML() as Object)
                    .getEncoded())
                .getDecoded() as Map<String, Object?>? ??
            <String, Object?>{})
        .appConfig;
    (wb?.buildOwner?.debugBuilding ?? true)
        ? doNothing()
        : runApp(const MyApp());
  } catch (e) {
    e.jot();
  }
}
