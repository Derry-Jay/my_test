import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/values.dart';

class Css {
  Css._internal();

  static final Css _singleton = Css._internal();

  factory Css() => _singleton;

  final zeroPadding = EdgeInsets.zero,
      stockSubscriptStyle = 'ubuntu'
          .getStyleFromFont(color: shades.kWhite1, fontSize: dimensions.small),
      stockInfoStyle = 'ubuntu'
          .getStyleFromFont(color: rainbow.kGrey, fontSize: dimensions.xs),
      stockTitleStyle = 'ubuntu'.getStyleFromFont(
          color: shades.kWhite1,
          fontWeight: 600.fontWeight,
          fontSize: dimensions.medium),
      theme = ThemeData(
          useMaterial3: true,
          dividerColor: shades.kGrey2,
          colorSchemeSeed: shades.kGreen1,
          scaffoldBackgroundColor: shades.kBlack1,
          appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: false,
              backgroundColor: rainbow.kBlack,
              foregroundColor: shades.kWhite1,
              titleTextStyle: 'ubuntu'.getStyleFromFont(
                  color: shades.kWhite1,
                  fontSize: dimensions.xl,
                  fontWeight: 700.fontWeight)),
          tabBarTheme: TabBarTheme(
              labelColor: rainbow.kGreen,
              dividerColor: rainbow.kBlack,
              indicatorColor: rainbow.kGreen,
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: shades.kWhite1,
              labelStyle:
                  'ubuntu'.getStyleFromFont(fontSize: dimensions.normal),
              unselectedLabelStyle:
                  'ubuntu'.getStyleFromFont(fontSize: dimensions.normal)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: shades.kBlack2,
              selectedItemColor: rainbow.kGreen,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: shades.kWhite1,
              selectedLabelStyle:
                  'ubuntu'.getStyleFromFont(fontSize: dimensions.normal),
              unselectedLabelStyle:
                  'ubuntu'.getStyleFromFont(fontSize: dimensions.normal)),
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
