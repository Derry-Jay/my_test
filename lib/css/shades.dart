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
      kWhite = Colors.white,
      kOrange = Colors.orange,
      kLightBlue = Colors.lightBlue,
      kDeepPurple = Colors.deepPurple,
      kBlueAccent = Colors.blueAccent,
      kTransparent = Colors.transparent,
      kGrey1 = Shade(1, 'grey').fromConfigs,
      kGold1 = Shade(1, 'gold').fromConfigs,
      kBlack1 = Shade(1, 'black').fromConfigs,
      kOrangeAccent = Colors.deepOrangeAccent;
}
