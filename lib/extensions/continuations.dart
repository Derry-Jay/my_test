import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:intl/intl.dart';

import '../utils/enums.dart';
import '../utils/values.dart';
import 'extensions.dart';

extension SizeUt on Size? {
  Widget constrainChild({Widget? child}) =>
      SizedBox.fromSize(size: this, child: child);
}

extension CardT on CardType? {
  Card card(
      {Key? key,
      Color? color,
      Widget? child,
      double? elevation,
      Clip? clipBehavior,
      Color? shadowColor,
      ShapeBorder? shape,
      bool? semanticContainer,
      Color? surfaceTintColor,
      bool? borderOnForeground,
      EdgeInsetsGeometry? margin}) {
    switch (this) {
      case CardType.filled:
        return Card.filled(
            key: key,
            color: color,
            shape: shape,
            margin: margin,
            elevation: elevation,
            shadowColor: shadowColor,
            clipBehavior: clipBehavior,
            surfaceTintColor: shadowColor,
            semanticContainer: semanticContainer ?? true,
            borderOnForeground: borderOnForeground ?? true);
      case CardType.outlined:
        return Card.outlined(
            key: key,
            color: color,
            shape: shape,
            margin: margin,
            elevation: elevation,
            shadowColor: shadowColor,
            clipBehavior: clipBehavior,
            surfaceTintColor: shadowColor,
            semanticContainer: semanticContainer ?? true,
            borderOnForeground: borderOnForeground ?? true);
      default:
        return Card(
            key: key,
            color: color,
            shape: shape,
            margin: margin,
            elevation: elevation,
            shadowColor: shadowColor,
            clipBehavior: clipBehavior,
            surfaceTintColor: shadowColor,
            semanticContainer: semanticContainer ?? true,
            borderOnForeground: borderOnForeground ?? true);
    }
  }
}

extension BorderUtil on BorderSide? {
  StadiumBorder get stadiumBorder =>
      StadiumBorder(side: this ?? BorderSide.none);

  CircleBorder circleBorder({double? ecc}) => CircleBorder(
      side: this ?? BorderSide.none, eccentricity: ecc ?? measurements.nil);
}

extension StrHp on String {
  Finder getTextFinder({bool? findRichText, bool? skipOffstage}) {
    return find.text(this,
        findRichText: findRichText ?? false,
        skipOffstage: skipOffstage ?? true);
  }

  Finder getContainingTextFinder({bool? findRichText, bool? skipOffstage}) {
    return find.textContaining(this,
        findRichText: findRichText ?? false,
        skipOffstage: skipOffstage ?? true);
  }
}

extension Usefullness on IconData {
  Finder getIconFinder({bool? skipOffstage}) {
    return find.byIcon(this, skipOffstage: skipOffstage ?? true);
  }

  GradientIcon gradientIconBuilder(Gradient gradient,
          {double? size, Offset? offset, Key? key}) =>
      GradientIcon(
          key: key,
          icon: this,
          offset: offset,
          gradient: gradient,
          size: size ?? measurements.defaultGradientIconSize);
}

extension StrUtil on String {
  ImageProvider imageProvider(
          {Size? size,
          Color? color,
          double? scale,
          String? package,
          AssetBundle? bundle,
          Map<String, String>? headers,
          Future<String?> Function(SvgImageKey)? svgGetter}) =>
      isSvg
          ? Svg(trimmed,
              size: size,
              color: color,
              scale: scale,
              svgGetter: svgGetter,
              source: isFromServer
                  ? SvgSource.network
                  : (isFromAsset ? SvgSource.asset : SvgSource.file))
          : (isFromServer
              ? NetworkImage(trimmed,
                  scale: scale ?? measurements.unit, headers: headers)
              : (isFromAsset
                  ? AssetImage(trimmed, package: package, bundle: bundle)
                  : FileImage(file, scale: scale ?? measurements.unit)));
}

extension StrUt on String? {
  NumberFormat get fromPattern => NumberFormat(this);

  NumberFormat get fromLocale => NumberFormat(null, this);

  Locale getFromSubTags({String? scriptCode, String? countryCode}) =>
      Locale.fromSubtags(
          scriptCode: scriptCode,
          countryCode: countryCode,
          languageCode: this ?? 'und');

  ThemeMode? get tm {
    switch (this?.trimmed.lowerCased) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      default:
        return null;
    }
  }
}

extension DoubUt on double? {
  Widget squareConstrainChild({Widget? child}) =>
      SizedBox.square(dimension: this, child: child);

  CircularProgressIndicator getAdaptiveLoader(
          {double? strokeWidth,
          StrokeCap? strokeCap,
          Color? backgroundColor,
          String? semanticsLabel,
          String? semanticsValue,
          Animation<Color?>? valueColor}) =>
      CircularProgressIndicator.adaptive(
          value: this,
          strokeCap: strokeCap,
          valueColor: valueColor,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          strokeWidth: strokeWidth ?? measurements.defaultStrokeWidth);
}

extension Extension on Uint8List {
  Future<Codec> setImageCodec(
          {int? targetWidth, int? targetHeight, bool? allowUpscaling}) =>
      instantiateImageCodec(this,
          targetWidth: targetWidth,
          targetHeight: targetHeight,
          allowUpscaling: allowUpscaling ?? true);
}

extension DateUtils on DateTime {
  String get formattedDate1 => isToday
      ? 'Today'
      : (isYesterday
          ? 'Yesterday'
          : (isCurrentYear
              ? DateFormat.MMMMd().format(this)
              : DateFormat.yMMMMd('en_US').format(this)));
}

extension IntUt1 on int? {
  FontWeight get fontWeight {
    switch (this) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }
}

extension ShapeUt on BoxShape? {
  BoxDecoration boxDecoration(
          {Color? color,
          BoxBorder? border,
          Gradient? gradient,
          DecorationImage? image,
          List<BoxShadow>? boxShadow,
          BlendMode? backgroundBlendMode,
          BorderRadiusGeometry? borderRadius}) =>
      BoxDecoration(
          color: color,
          image: image,
          border: border,
          gradient: gradient,
          boxShadow: boxShadow,
          borderRadius: borderRadius,
          shape: this ?? BoxShape.rectangle,
          backgroundBlendMode: backgroundBlendMode);
}

extension ClipUt on Clip? {
  Container container(
          {Key? key,
          Color? color,
          Widget? child,
          double? width,
          double? height,
          Matrix4? transform,
          Decoration? decoration,
          EdgeInsetsGeometry? margin,
          BoxConstraints? constraints,
          EdgeInsetsGeometry? padding,
          AlignmentGeometry? alignment,
          Decoration? foregroundDecoration,
          AlignmentGeometry? transformAlignment}) =>
      Container(
          key: key,
          color: color,
          width: width,
          height: height,
          margin: margin,
          padding: margin,
          alignment: alignment,
          transform: transform,
          decoration: decoration,
          constraints: constraints,
          clipBehavior: this ?? Clip.none,
          transformAlignment: transformAlignment,
          foregroundDecoration: foregroundDecoration,
          child: child);
}
