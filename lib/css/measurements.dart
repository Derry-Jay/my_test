import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Measurements {
  static final Measurements _singleton = Measurements._internal();

  factory Measurements() => _singleton;

  Measurements._internal();

  final double customIconSize =
      'xs'.valFromConfig<String>()?.toInt().sp ?? double.nan;
}
