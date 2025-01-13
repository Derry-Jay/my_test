import 'package:flutter/material.dart';

import '../models/common/shade.dart';

class Shades {
  static final Shades _singleton = Shades._internal();

  factory Shades() => _singleton;

  Shades._internal();

  final kRed = Colors.red,
      kBlue = Colors.blue,
      kGrey = Colors.grey,
      kTeal = Colors.teal,
      kBlack = Colors.black,
      kGreen = Colors.green,
      kWhite = Colors.white,
      kPurple = Colors.purple,
      kOrange = Colors.orange,
      kLightBlue = Colors.lightBlue,
      kDeepPurple = Colors.deepPurple,
      kBlueAccent = Colors.blueAccent,
      kTransparent = Colors.transparent,
      kGold1 = Shade(1, 'gold').fromConfigs,
      kGrey1 = Shade(1, 'grey').fromConfigs,
      kGrey2 = Shade(2, 'grey').fromConfigs,
      kBlack1 = Shade(1, 'black').fromConfigs,
      kBlack2 = Shade(2, 'black').fromConfigs,
      kBlack3 = Shade(3, 'black').fromConfigs,
      kGreen1 = Shade(1, 'green').fromConfigs,
      kWhite1 = Shade(1, 'white').fromConfigs,
      kOrangeAccent = Colors.deepOrangeAccent;
}
