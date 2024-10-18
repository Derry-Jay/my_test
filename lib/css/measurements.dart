import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/extensions.dart';

class Measurements {
  static final Measurements _singleton = Measurements._internal();

  factory Measurements() => _singleton;

  Measurements._internal();

  final nil = 0.sp,
      unit = 1.sp,
      nilHt = 0.h,
      nilWb = 0.w,
      unitHt = 1.h,
      unitWb = 1.w,
      customStepGranularity = 2.sp,
      toolbarHeight = kToolbarHeight.h,
      xs = 'xs'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl = 'xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xs2 = '2xs'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xs3 = '3xs'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xs4 = '4xs'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl2 = '2xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl3 = '3xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl4 = '4xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl5 = '5xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      small = 'small'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      large = 'large'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      medium = 'medium'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      normal = 'normal'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      appleFieldWithoutBorderPadding =
          (('medium'.valFromConfig<String>()?.toDouble(double.nan) ?? double.nan) /
                  2)
              .sp,
      defaultAppleDatePickerItemExtent =
          (('large'.valFromConfig<String>()?.toInt() ?? 0) * 2).sp,
      defaultSpinLinesHt = (('large'.valFromConfig<String>()?.toInt() ?? 0) +
              ('xl'.valFromConfig<String>()?.toInt() ?? 0) +
              ('5xl'.valFromConfig<String>()?.toInt() ?? 0) +
              ('small'.valFromConfig<String>()?.toInt() ?? 0))
          .h,
      defaultSpinLinesWidth = (('xs'.valFromConfig<String>()?.toInt() ?? 0) /
              ('3xs'.valFromConfig<String>()?.toInt() ?? 0))
          .w,
      defaultDancingSquareLoaderHt =
          (('large'.valFromConfig<String>()?.toInt() ?? 0) +
                  ('xl'.valFromConfig<String>()?.toInt() ?? 0) +
                  ('5xl'.valFromConfig<String>()?.toInt() ?? 0))
              .h,
      defaultLoaderHt =
          (('4xl'.valFromConfig<String>()?.toInt() ?? 0) + ('5xl'.valFromConfig<String>()?.toInt() ?? 0)).h,
      stretchTriggerOffset = ((('4xl'.valFromConfig<String>()?.toInt().sp ?? double.nan) + ('5xl'.valFromConfig<String>()?.toInt().sp ?? double.nan)) * 2).sp,
      defaultGradientIconSize = ((('4xl'.valFromConfig<String>()?.toInt() ?? 0) + ('3xl'.valFromConfig<String>()?.toInt() ?? 0) + ('3xs'.valFromConfig<String>()?.toInt() ?? 0)) / 2).sp;
}
