import 'dart:io';

import 'package:flutter/material.dart';

import '/extensions/extensions.dart';
import 'models/common/custom_http.dart';
import 'my_app.dart';
import 'utils/methods.dart';
import 'utils/values.dart';

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
