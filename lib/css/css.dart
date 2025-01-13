import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../extensions/continuations.dart';
import '../extensions/extensions.dart';
import '../utils/values.dart';

class Css {
  static final Css _singleton = Css._internal();

  factory Css() => _singleton;

  Css._internal();

  final zeroPadding = EdgeInsets.zero,
      cupertinoFieldPlaceHolderStyleDefault =
          'roboto'.getStyleFromFont(color: CupertinoColors.placeholderText),
      stockSubscriptStyle = 'ubuntu'.getStyleFromFont(
          color: shades.kWhite1, fontSize: measurements.small),
      stockInfoStyle = 'ubuntu'
          .getStyleFromFont(color: shades.kGrey, fontSize: measurements.xs),
      stockTitleStyle = 'ubuntu'.getStyleFromFont(
          color: shades.kWhite1,
          fontSize: measurements.medium,
          fontWeight: 600.fontWeight),
      defaultAppleAppBarBorder = Border(
          bottom: BorderSide(color: shades.kBlack1, width: measurements.nilWb)),
      theme = ThemeData(
          useMaterial3: true,
          dividerColor: shades.kGrey2,
          colorSchemeSeed: shades.kGreen1,
          scaffoldBackgroundColor: shades.kBlack1,
          appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: false,
              backgroundColor: shades.kBlack,
              foregroundColor: shades.kWhite1,
              titleTextStyle: 'ubuntu'.getStyleFromFont(
                  color: shades.kWhite1,
                  fontSize: measurements.xl,
                  fontWeight: 700.fontWeight)),
          tabBarTheme: TabBarTheme(
              labelColor: shades.kGreen,
              dividerColor: shades.kBlack,
              indicatorColor: shades.kGreen,
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: shades.kWhite1,
              labelStyle:
                  'ubuntu'.getStyleFromFont(fontSize: measurements.normal),
              unselectedLabelStyle:
                  'ubuntu'.getStyleFromFont(fontSize: measurements.normal)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: shades.kBlack2,
              selectedItemColor: shades.kGreen,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: shades.kWhite1,
              selectedLabelStyle:
                  'ubuntu'.getStyleFromFont(fontSize: measurements.normal),
              unselectedLabelStyle:
                  'ubuntu'.getStyleFromFont(fontSize: measurements.normal)),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: shades.kBlack2,
              hintStyle: 'ubuntu'.getStyleFromFont(color: shades.kGrey2),
              labelStyle: 'ubuntu'.getStyleFromFont(color: shades.kGrey2),
              helperStyle: 'ubuntu'.getStyleFromFont(color: shades.kGrey2))),
      appleTheme = CupertinoThemeData(
        primaryColor: shades.kGrey1,
      );
}
