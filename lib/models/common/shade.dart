import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/values.dart';

class Shade {
  final int variantID;
  final String color;
  Shade(this.variantID, this.color);
  Color get fromConfigs {
    final cm = gc?.getValue<Map<String, Object?>>(
            '${color}_color_variant_$variantID') ??
        <String, Object?>{};
    '----------------'.jot();
    cm['color'].jot();
    '________________'.jot();
    '----------------'.jot();
    cm['alpha'].jot();
    '________________'.jot();
    '----------------'.jot();
    jot();
    '________________'.jot();
    return cm['color'].string.getColorFromHex(cm['alpha'].string);
  }

  @override
  String toString() => 'k${color.firstLetterCapitalized}$variantID';

  @override
  bool operator ==(Object other) =>
      other is Shade &&
      other.variantID == variantID &&
      other.color.lowerCased == color.lowerCased;

  @override
  // TODO: implement hashCode
  int get hashCode => variantID.hashCode + color.hashCode;
}
