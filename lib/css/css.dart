import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import '../utils/values.dart';

class Css {
  static final Css _singleton = Css._internal();

  factory Css() => _singleton;

  Css._internal();

  final cupertinoFieldPlaceHolderStyleDefault =
          'roboto'.getStyleFromFont(color: CupertinoColors.placeholderText),
      defaultAppleAppBarBorder = Border(
        bottom: BorderSide(
          color: shades.kBlack1,
          width: measurements.nilWb,
        ),
      ),
      theme =
          ThemeData(useMaterial3: true, colorSchemeSeed: shades.kDeepPurple),
      appleTheme = CupertinoThemeData(
        primaryColor: shades.kGrey1,
      );
}
