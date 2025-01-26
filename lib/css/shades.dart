import '../models/shade.dart';

class Shades {
  Shades._internal();

  static final Shades _singleton = Shades._internal();

  factory Shades() => _singleton;

  final kGold1 = Shade(1, 'gold').fromConfigs,
      kGrey1 = Shade(1, 'grey').fromConfigs,
      kGrey2 = Shade(2, 'grey').fromConfigs,
      kBlack1 = Shade(1, 'black').fromConfigs,
      kBlack2 = Shade(2, 'black').fromConfigs,
      kBlack3 = Shade(3, 'black').fromConfigs,
      kGreen1 = Shade(1, 'green').fromConfigs,
      kWhite1 = Shade(1, 'white').fromConfigs;
}
