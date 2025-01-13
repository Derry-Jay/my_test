import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fraction/fraction.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_platform_interface/types/auth_messages.dart';
import 'package:shared_preferences/src/shared_preferences_legacy.dart';
import '../blocs/icon_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:yaml/src/error_listener.dart';
import 'package:yaml/yaml.dart';

import '../blocs/stock_bloc.dart';
import '../blocs/tab_bloc.dart';
import '../models/common/app_config.dart';
import '../utils/enums.dart';
import '../utils/keys.dart';
import '../utils/methods.dart';
import '../utils/typedefs.dart';
import '../utils/values.dart';
import '../views/widgets/common/circular_loader.dart';
import '../views/widgets/common/custom_button.dart';
import '../views/widgets/common/empty_widget.dart';
import 'continuations.dart';

extension Pos on Position {
  LatLng get ll => LatLng(latitude, longitude);
}

extension Co on Radius {
  BorderRadius get all => BorderRadius.all(this);
}

extension Pad on EdgeInsetsGeometry {
  Padding paddedWidget({Widget? child}) => Padding(padding: this, child: child);
}

extension Exte on List<DeviceOrientation> {
  void setAllowedOrientations() async {
    await SystemChrome.setPreferredOrientations(this);
  }
}

extension Exten on SystemUiMode {
  void setSystemUIMode([List<SystemUiOverlay>? overlays]) async {
    await SystemChrome.setEnabledSystemUIMode(this, overlays: overlays);
  }
}

extension Asdfgh on X509Certificate {
  bool get isValid =>
      (DateTime.now().isAfter(startValidity) ||
          DateTime.now().isAtSameMomentAs(startValidity)) &&
      DateTime.now().isBefore(endValidity);
}

extension Assistant on AxisDirection {
  Axis get axis => axisDirectionToAxis(this);

  bool get isReversed => axisDirectionIsReversed(this);
}

extension Use<T extends Iterable<U>, U extends Object?> on T {
  bool get isSingle => length == 1;

  List<U> sortedElements([int Function(U, U)? compare]) =>
      <U>[...this]..sort(compare);
}

extension Subordinate on HttpClientResponse {
  Future<Uint8List> uniteHttpClientResponseBytes(
          [bool? autoUncompress, void Function(int, int?)? onBytesReceived]) =>
      consolidateHttpClientResponseBytes(this,
          onBytesReceived: onBytesReceived,
          autoUncompress: autoUncompress ?? true);
}

extension Formatters on Pattern {
  FilteringTextInputFormatter admit([String? replacement]) =>
      FilteringTextInputFormatter.allow(this,
          replacementString: replacement ?? '');

  FilteringTextInputFormatter restrict([String? replacement]) =>
      FilteringTextInputFormatter.deny(this,
          replacementString: replacement ?? '');
}

extension Zxcvbnm on PolylineRequest {
  Future<List<PolylineResult>> obtainRouteWithAlternatives(
          {String? googleApiKey}) =>
      mpp.getRouteWithAlternatives(request: this, googleApiKey: googleApiKey);

  Future obtainRouteBetweenLatLong({String? googleApiKey}) =>
      mpp.getRouteBetweenCoordinates(request: this, googleApiKey: googleApiKey);
}

extension ListStringUtils on Iterable<String> {
  Set<String> get commonPattern {
    Set<String> rs = <String>{};
    if (isEmpty) {
    } else if (isSingle) {
      rs = <String>{single};
    } else {
      final List<String> l = <String>[...this];
      for (String str in this) {
        final int i = l.indexOf(str), next = i + 1;
        rs = next == length
            ? rs
            : rs.union(<String>{l[i].getCommonPattern(l[next])});
      }
    }
    return rs;
  }
}

extension GradUt on Iterable<Color> {
  LinearGradient linearGradient(
          {TileMode? tileMode,
          List<double>? stops,
          AlignmentGeometry? end,
          AlignmentGeometry? begin,
          GradientTransform? transform}) =>
      LinearGradient(
          stops: stops,
          colors: toList(),
          transform: transform,
          end: end ?? Alignment.centerRight,
          begin: begin ?? Alignment.centerLeft,
          tileMode: tileMode ?? TileMode.clamp);

  RadialGradient radialGradient(
          {double? radius,
          TileMode? tileMode,
          double? focalRadius,
          List<double>? stops,
          AlignmentGeometry? focal,
          AlignmentGeometry? centre,
          GradientTransform? transform}) =>
      RadialGradient(
          focal: focal,
          stops: stops,
          colors: toList(),
          transform: transform,
          radius: radius ?? 0.5,
          focalRadius: focalRadius ?? 0.0,
          center: centre ?? Alignment.center,
          tileMode: tileMode ?? TileMode.clamp);

  SweepGradient sweepGradient(
          {double? endAngle,
          double? startAngle,
          TileMode? tileMode,
          List<double>? stops,
          AlignmentGeometry? centre,
          GradientTransform? transform}) =>
      SweepGradient(
          stops: stops,
          colors: toList(),
          transform: transform,
          center: centre ?? Alignment.center,
          tileMode: tileMode ?? TileMode.clamp,
          endAngle: endAngle?.radians.float ?? (pi * 2),
          startAngle: (startAngle ?? 0.0).radians.float);
}

extension Decor on ImageProvider {
  DecorationImage getDecorImage(
          {BoxFit? fit,
          double? scale,
          double? opacity,
          bool? isAntiAlias,
          Rect? centerSlice,
          bool? invertColors,
          ImageRepeat? repeat,
          ColorFilter? colorFilter,
          bool? matchTextDirection,
          AlignmentGeometry? alignment,
          FilterQuality? filterQuality,
          void Function(Object, StackTrace?)? onError}) =>
      DecorationImage(
          fit: fit,
          image: this,
          onError: onError,
          opacity: opacity ?? 1.0,
          centerSlice: centerSlice,
          colorFilter: colorFilter,
          scale: scale ?? measurements.unit,
          isAntiAlias: isAntiAlias ?? false,
          invertColors: invertColors ?? false,
          repeat: repeat ?? ImageRepeat.noRepeat,
          alignment: alignment ?? Alignment.center,
          matchTextDirection: matchTextDirection ?? false,
          filterQuality: filterQuality ?? 'low'.filterQuality);
}

extension E1 on void Function(DateTime) {
  CupertinoDatePicker getAppleDatePicker(
          {Key? key,
          int? minimumYear,
          int? maximumYear,
          double? itemExtent,
          bool? use24hFormat,
          bool? showDayOfWeek,
          int? minuteInterval,
          DateTime? minimumDate,
          DateTime? maximumDate,
          Color? backgroundColor,
          DateTime? initialDateTime,
          CupertinoDatePickerMode? mode,
          DatePickerDateOrder? dateOrder}) =>
      CupertinoDatePicker(
          dateOrder: dateOrder,
          onDateTimeChanged: this,
          maximumDate: maximumDate,
          minimumDate: minimumDate,
          maximumYear: maximumYear,
          minimumYear: minimumYear ?? 1,
          initialDateTime: initialDateTime,
          backgroundColor: backgroundColor,
          use24hFormat: use24hFormat ?? false,
          minuteInterval: minuteInterval ?? 1,
          showDayOfWeek: showDayOfWeek ?? false,
          mode: mode ?? CupertinoDatePickerMode.dateAndTime,
          itemExtent:
              itemExtent ?? measurements.defaultAppleDatePickerItemExtent);
}

extension CamUp on CameraPosition {
  CameraUpdate get cameraUpdate => CameraUpdate.newCameraPosition(this);

  GoogleMap googleMap(
          {Key? key,
          String? style,
          MapType? mapType,
          String? cloudMapId,
          EdgeInsets? padding,
          Set<Circle>? circles,
          bool? compassEnabled,
          Set<Marker>? markers,
          bool? trafficEnabled,
          bool? liteModeEnabled,
          bool? buildingsEnabled,
          Set<Heatmap>? heatmaps,
          Set<Polygon>? polygons,
          bool? indoorViewEnabled,
          bool? mapToolbarEnabled,
          bool? myLocationEnabled,
          Set<Polyline>? polylines,
          bool? tiltGesturesEnabled,
          bool? zoomControlsEnabled,
          bool? zoomGesturesEnabled,
          VoidCallback? onCameraIdle,
          bool? rotateGesturesEnabled,
          bool? scrollGesturesEnabled,
          void Function(LatLng)? onTap,
          bool? myLocationButtonEnabled,
          TextDirection? layoutDirection,
          Set<TileOverlay>? tileOverlays,
          VoidCallback? onCameraMoveStarted,
          void Function(LatLng)? onLongPress,
          bool? fortyFiveDegreeImageryEnabled,
          Set<ClusterManager>? clusterManagers,
          CameraTargetBounds? cameraTargetBounds,
          WebGestureHandling? webGestureHandling,
          MinMaxZoomPreference? minMaxZoomPreference,
          void Function(CameraPosition)? onCameraMove,
          void Function(GoogleMapController)? onMapCreated,
          Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers}) =>
      GoogleMap(
          key: key,
          onTap: onTap,
          style: style,
          cloudMapId: cloudMapId,
          onLongPress: onLongPress,
          onCameraIdle: onCameraIdle,
          onCameraMove: onCameraMove,
          onMapCreated: onMapCreated,
          initialCameraPosition: this,
          layoutDirection: layoutDirection,
          mapType: mapType ?? MapType.normal,
          padding: padding ?? css.zeroPadding,
          circles: circles ?? const <Circle>{},
          markers: markers ?? const <Marker>{},
          compassEnabled: compassEnabled ?? true,
          webGestureHandling: webGestureHandling,
          heatmaps: heatmaps ?? const <Heatmap>{},
          polygons: polygons ?? const <Polygon>{},
          trafficEnabled: trafficEnabled ?? false,
          onCameraMoveStarted: onCameraMoveStarted,
          liteModeEnabled: liteModeEnabled ?? false,
          buildingsEnabled: buildingsEnabled ?? true,
          polylines: polylines ?? const <Polyline>{},
          mapToolbarEnabled: mapToolbarEnabled ?? true,
          indoorViewEnabled: indoorViewEnabled ?? false,
          myLocationEnabled: myLocationEnabled ?? false,
          tiltGesturesEnabled: tiltGesturesEnabled ?? true,
          zoomControlsEnabled: zoomControlsEnabled ?? true,
          zoomGesturesEnabled: zoomGesturesEnabled ?? true,
          tileOverlays: tileOverlays ?? const <TileOverlay>{},
          rotateGesturesEnabled: rotateGesturesEnabled ?? true,
          scrollGesturesEnabled: scrollGesturesEnabled ?? true,
          myLocationButtonEnabled: myLocationButtonEnabled ?? true,
          clusterManagers: clusterManagers ?? const <ClusterManager>{},
          fortyFiveDegreeImageryEnabled: fortyFiveDegreeImageryEnabled ?? false,
          gestureRecognizers: gestureRecognizers ??
              const <Factory<OneSequenceGestureRecognizer>>{},
          cameraTargetBounds:
              cameraTargetBounds ?? CameraTargetBounds.unbounded,
          minMaxZoomPreference:
              minMaxZoomPreference ?? MinMaxZoomPreference.unbounded);
}

extension BottomNavigation<T extends Iterable<BottomNavigationBarItem>> on T? {
  static final List<BottomNavigationBarItem> emptyList =
      <BottomNavigationBarItem>[];

  BottomNavigationBar getBottomNavigationBar(
      {Key? key,
      int? index,
      double? iconSize,
      double? elevation,
      Color? fixedColor,
      bool? enableFeedback,
      Color? backgroundColor,
      MouseCursor? mouseCursor,
      Color? selectedItemColor,
      bool? showSelectedLabels,
      double? selectedFontSize,
      IntegerChanged? onTap,
      double? unselectedFontSize,
      Color? unselectedItemColor,
      bool? showUnselectedLabels,
      bool? useLegacyColorScheme,
      BottomNavigationBarType? type,
      TextStyle? selectedLabelStyle,
      TextStyle? unselectedLabelStyle,
      IconThemeData? selectedIconTheme,
      IconThemeData? unselectedIconTheme,
      BottomNavigationBarLandscapeLayout? landscapeLayout}) {
    return BottomNavigationBar(
        key: key,
        type: type,
        onTap: onTap,
        elevation: elevation,
        fixedColor: fixedColor,
        currentIndex: index ?? 0,
        mouseCursor: mouseCursor,
        enableFeedback: enableFeedback,
        landscapeLayout: landscapeLayout,
        backgroundColor: backgroundColor,
        items: this?.toList() ?? emptyList,
        selectedIconTheme: selectedIconTheme,
        selectedItemColor: selectedItemColor,
        selectedLabelStyle: selectedLabelStyle,
        showSelectedLabels: showSelectedLabels,
        unselectedIconTheme: unselectedIconTheme,
        unselectedItemColor: unselectedItemColor,
        showUnselectedLabels: showUnselectedLabels,
        unselectedLabelStyle: unselectedLabelStyle,
        iconSize: iconSize ?? measurements.defaultIconSize,
        useLegacyColorScheme: useLegacyColorScheme ?? true,
        selectedFontSize: selectedFontSize ?? measurements.medium,
        unselectedFontSize: unselectedFontSize ?? measurements.normal);
  }
}

extension WidUt<T extends Widget> on T {
  Expanded wrapWithExpanded({Key? key, int? flex}) =>
      Expanded(key: key, flex: flex ?? 1, child: this);

  Flexible wrapWithFlexible({Key? key, int? flex, FlexFit? fit}) => Flexible(
      key: key, flex: flex ?? 1, fit: fit ?? FlexFit.loose, child: this);

  Visibility showOrHide(
          {Key? key,
          bool? visible,
          bool? maintain,
          bool? maintainSize,
          bool? maintainState,
          Widget? replacement,
          bool? maintainAnimation,
          bool? maintainSemantics,
          bool? maintainInteractivity}) =>
      (maintain ?? false)
          ? Visibility.maintain(key: key, visible: visible ?? true, child: this)
          : Visibility(
              key: key,
              visible: visible ?? true,
              maintainSize: maintainSize ?? false,
              maintainState: maintainState ?? false,
              maintainAnimation: maintainAnimation ?? false,
              maintainSemantics: maintainSemantics ?? false,
              replacement: replacement ?? const SizedBox.shrink(),
              maintainInteractivity: maintainInteractivity ?? false,
              child: this);

  SafeArea wrapWithinSafeArea(
          {Key? key,
          bool? top,
          bool? left,
          bool? right,
          bool? bottom,
          EdgeInsets? minimum,
          bool? maintainBottomViewPadding}) =>
      SafeArea(
          key: key,
          top: top ?? true,
          left: left ?? true,
          right: right ?? true,
          bottom: bottom ?? true,
          minimum: minimum ?? css.zeroPadding,
          maintainBottomViewPadding: maintainBottomViewPadding ?? false,
          child: this);

  BottomNavigationBarItem itemBottomNavigationBar(
          {Key? key,
          String? label,
          String? tooltip,
          Widget? activeIcon,
          Color? backgroundColor}) =>
      BottomNavigationBarItem(
          key: key,
          icon: this,
          label: label,
          tooltip: tooltip,
          activeIcon: activeIcon,
          backgroundColor: backgroundColor);

  Chip chip(
          {Key? key,
          Color? color,
          Widget? avatar,
          bool? autofocus,
          BorderSide? side,
          double? elevation,
          Clip? clipBehavior,
          Widget? deleteIcon,
          Color? shadowColor,
          FocusNode? focusNode,
          TextStyle? labelStyle,
          OutlinedBorder? shape,
          Color? backgroundColor,
          Color? deleteIconColor,
          Color? surfaceTintColor,
          VoidCallback? onDeleted,
          IconThemeData? iconTheme,
          EdgeInsetsGeometry? padding,
          VisualDensity? visualDensity,
          EdgeInsetsGeometry? labelPadding,
          String? deleteButtonTooltipMessage,
          BoxConstraints? avatarBoxConstraints,
          ChipAnimationStyle? chipAnimationStyle,
          BoxConstraints? deleteIconBoxConstraints,
          MaterialTapTargetSize? materialTapTargetSize}) =>
      Chip(
          key: key,
          side: side,
          label: this,
          shape: shape,
          avatar: avatar,
          padding: padding,
          elevation: elevation,
          focusNode: focusNode,
          iconTheme: iconTheme,
          onDeleted: onDeleted,
          deleteIcon: deleteIcon,
          labelStyle: labelStyle,
          shadowColor: shadowColor,
          labelPadding: labelPadding,
          visualDensity: visualDensity,
          autofocus: autofocus ?? false,
          backgroundColor: backgroundColor,
          deleteIconColor: deleteIconColor,
          surfaceTintColor: surfaceTintColor,
          chipAnimationStyle: chipAnimationStyle,
          clipBehavior: clipBehavior ?? Clip.none,
          avatarBoxConstraints: avatarBoxConstraints,
          materialTapTargetSize: materialTapTargetSize,
          color: color?.allWidgetStateProperty<Color?>(),
          deleteIconBoxConstraints: deleteIconBoxConstraints,
          deleteButtonTooltipMessage: deleteButtonTooltipMessage);

  FilterChip filterChip(
          {Key? key,
          Color? color,
          Widget? avatar,
          bool? selected,
          bool? autofocus,
          BorderSide? side,
          double? elevation,
          Clip? clipBehavior,
          Widget? deleteIcon,
          Color? shadowColor,
          bool? showCheckmark,
          FocusNode? focusNode,
          Color? selectedColor,
          Color? disabledColor,
          Color? checkmarkColor,
          TextStyle? labelStyle,
          OutlinedBorder? shape,
          Color? backgroundColor,
          Color? deleteIconColor,
          Color? surfaceTintColor,
          VoidCallback? onDeleted,
          IconThemeData? iconTheme,
          Color? selectedShadowColor,
          EdgeInsetsGeometry? padding,
          VisualDensity? visualDensity,
          void Function(bool)? onSelected,
          EdgeInsetsGeometry? labelPadding,
          String? deleteButtonTooltipMessage,
          BoxConstraints? avatarBoxConstraints,
          ChipAnimationStyle? chipAnimationStyle,
          BoxConstraints? deleteIconBoxConstraints,
          MaterialTapTargetSize? materialTapTargetSize}) =>
      FilterChip(
          key: key,
          side: side,
          label: this,
          shape: shape,
          avatar: avatar,
          padding: padding,
          elevation: elevation,
          focusNode: focusNode,
          iconTheme: iconTheme,
          onDeleted: onDeleted,
          deleteIcon: deleteIcon,
          labelStyle: labelStyle,
          onSelected: onSelected,
          shadowColor: shadowColor,
          labelPadding: labelPadding,
          selected: selected ?? false,
          disabledColor: disabledColor,
          selectedColor: selectedColor,
          showCheckmark: showCheckmark,
          visualDensity: visualDensity,
          autofocus: autofocus ?? false,
          checkmarkColor: checkmarkColor,
          backgroundColor: backgroundColor,
          deleteIconColor: deleteIconColor,
          surfaceTintColor: surfaceTintColor,
          chipAnimationStyle: chipAnimationStyle,
          clipBehavior: clipBehavior ?? Clip.none,
          selectedShadowColor: selectedShadowColor,
          avatarBoxConstraints: avatarBoxConstraints,
          materialTapTargetSize: materialTapTargetSize,
          color: color?.allWidgetStateProperty<Color?>(),
          deleteIconBoxConstraints: deleteIconBoxConstraints,
          deleteButtonTooltipMessage: deleteButtonTooltipMessage);
}

extension DurationUt on Duration {
  Timer getTimer(VoidCallback callback) => Timer(this, callback);

  Timer getPeriodicTimer(void Function(Timer) callback) =>
      Timer.periodic(this, callback);

  AnimatedContainer animatedContainer(
      {Curve? curve,
      Color? color,
      Widget? child,
      double? width,
      double? height,
      Clip? clipBehavior,
      Matrix4? transform,
      VoidCallback? onEnd,
      Decoration? decoration,
      EdgeInsetsGeometry? margin,
      BoxConstraints? constraints,
      EdgeInsetsGeometry? padding,
      AlignmentGeometry? alignment,
      Decoration? foregroundDecoration,
      AlignmentGeometry? transformAlignment}) {
    return AnimatedContainer(
        color: color,
        onEnd: onEnd,
        width: width,
        duration: this,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
        transform: transform,
        decoration: decoration,
        constraints: constraints,
        curve: curve ?? Curves.linear,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior ?? Clip.none,
        foregroundDecoration: foregroundDecoration,
        child: child);
  }
}

extension Deputy on double {
  int get wholeNumber => lower;

  Size get sizeFromSquare => Size.square(this);

  Size get sizeFromWidth => Size.fromWidth(this);

  Size get sizeFromHeight => Size.fromHeight(this);

  Size get sizeFromRadius => Size.fromRadius(this);

  Radius get circularRadius => Radius.circular(this);

  EdgeInsets get allEdgeInsets => EdgeInsets.all(this);

  GradientRotation get gradientRotation => GradientRotation(radians.float);

  double get decimalPart {
    final double self = this;
    return self - wholeNumber;
  }

  BorderRadius get circularBorderRadius => BorderRadius.circular(this);

  Offset offsetFromDirection([double? distance]) =>
      Offset.fromDirection(this, distance ?? measurements.unit);
}

extension Cover on InlineSpan {
  Text wealthyText(
          {Key? key,
          int? maxLines,
          Locale? locale,
          bool? softWrap,
          TextStyle? style,
          TextAlign? textAlign,
          Color? selectionColor,
          TextScaler? textScaler,
          String? semanticsLabel,
          StrutStyle? strutStyle,
          TextOverflow? overflow,
          TextDirection? textDirection,
          TextWidthBasis? textWidthBasis,
          TextHeightBehavior? textHeightBehavior}) =>
      Text.rich(this,
          key: key,
          style: style,
          locale: locale,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
          textAlign: textAlign,
          textScaler: textScaler,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textWidthBasis: textWidthBasis,
          semanticsLabel: semanticsLabel,
          selectionColor: selectionColor,
          textHeightBehavior: textHeightBehavior);

  RichText richText(
          {Key? key,
          int? maxLines,
          Locale? locale,
          bool? softWrap,
          TextAlign? textAlign,
          Color? selectionColor,
          TextScaler? textScaler,
          StrutStyle? strutStyle,
          TextOverflow? overflow,
          TextDirection? textDirection,
          TextWidthBasis? textWidthBasis,
          SelectionRegistrar? selectionRegistrar,
          TextHeightBehavior? textHeightBehavior}) =>
      RichText(
          key: key,
          text: this,
          locale: locale,
          maxLines: maxLines,
          strutStyle: strutStyle,
          softWrap: softWrap ?? true,
          textDirection: textDirection,
          selectionColor: selectionColor,
          selectionRegistrar: selectionRegistrar,
          textHeightBehavior: textHeightBehavior,
          overflow: overflow ?? TextOverflow.clip,
          textAlign: textAlign ?? TextAlign.start,
          textScaler: textScaler ?? TextScaler.noScaling,
          textWidthBasis: textWidthBasis ?? TextWidthBasis.parent);
}

extension Widgets on WidgetBuilder {
  OverlayEntry getOverLay(
          {bool? opaque, bool? maintainState, bool? canSizeOverlay}) =>
      OverlayEntry(
          builder: this,
          opaque: opaque ?? false,
          maintainState: maintainState ?? false,
          canSizeOverlay: canSizeOverlay ?? false);

  MaterialPageRoute<T> getMaterialPageRoute<T extends Object?>(
          {bool? maintainState,
          bool? fullscreenDialog,
          bool? allowSnapshotting,
          RouteSettings? settings,
          bool? barrierDismissible}) =>
      MaterialPageRoute<T>(
          builder: this,
          settings: settings,
          maintainState: maintainState ?? true,
          fullscreenDialog: fullscreenDialog ?? false,
          allowSnapshotting: allowSnapshotting ?? true,
          barrierDismissible: barrierDismissible ?? false);

  CupertinoPageRoute<T> getCupertinoPageRoute<T extends Object?>(
          {String? title,
          bool? maintainState,
          bool? fullscreenDialog,
          bool? allowSnapshotting,
          RouteSettings? settings,
          bool? barrierDismissible}) =>
      CupertinoPageRoute<T>(
          title: title,
          builder: this,
          settings: settings,
          maintainState: maintainState ?? true,
          fullscreenDialog: fullscreenDialog ?? false,
          allowSnapshotting: allowSnapshotting ?? true,
          barrierDismissible: barrierDismissible ?? false);
}

extension ButtonUt on ButtonType? {
  CustomButton customButton(
          {Key? key,
          Widget? child,
          bool? isFilled,
          bool? autoFocus,
          Size? fixedSize,
          BorderSide? side,
          Color? iconColor,
          Color? focusColor,
          Color? hoverColor,
          Size? maximumSize,
          Size? minimumSize,
          double? elevation,
          Color? buttonColor,
          Clip? clipBehavior,
          Color? shadowColor,
          Color? splashColor,
          Color? overlayColor,
          bool? enableFeedback,
          TextStyle? textStyle,
          Color? disabledColor,
          FocusNode? focusNode,
          Color? highlightColor,
          OutlinedBorder? shape,
          double? focusElevation,
          Color? foregroundColor,
          double? hoverElevation,
          Color? surfaceTintColor,
          VoidCallback? onPressed,
          Color? disabledIconColor,
          double? disabledElevation,
          VoidCallback? onLongPress,
          double? highlightlevation,
          Duration? animationDuration,
          EdgeInsetsGeometry? padding,
          void Function(bool)? onHover,
          AlignmentGeometry? alignment,
          VisualDensity? visualDensity,
          Color? disabledForegroundColor,
          MouseCursor? enabledMouseCursor,
          MouseCursor? disabledMouseCursor,
          void Function(bool)? onFocusChange,
          MaterialTapTargetSize? tapTargetSize,
          WidgetStatesController? statesController,
          InteractiveInkFeatureFactory? splashFactory,
          Widget Function(BuildContext, Set<WidgetState>, Widget?)?
              backgroundBuilder,
          Widget Function(BuildContext, Set<WidgetState>, Widget?)?
              foregroundBuilder}) =>
      CustomButton(
          key: key,
          type: this,
          padding: padding,
          onHover: onHover,
          isFilled: isFilled,
          autoFocus: autoFocus,
          focusNode: focusNode,
          onPressed: onPressed,
          focusColor: focusColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          onLongPress: onLongPress,
          buttonColor: buttonColor,
          clipBehavior: clipBehavior,
          disabledColor: disabledColor,
          onFocusChange: onFocusChange,
          focusElevation: focusElevation,
          highlightColor: highlightColor,
          hoverElevation: hoverElevation,
          statesController: statesController,
          disabledElevation: disabledElevation,
          highlightElevation: highlightlevation,
          style: buttonStyle(
              side: side,
              shape: shape,
              padding: padding,
              alignment: alignment,
              elevation: elevation,
              fixedSize: fixedSize,
              iconColor: iconColor,
              textStyle: textStyle,
              maximumSize: maximumSize,
              minimumSize: maximumSize,
              shadowColor: shadowColor,
              overlayColor: overlayColor,
              splashFactory: splashFactory,
              tapTargetSize: tapTargetSize,
              visualDensity: visualDensity,
              backgroundColor: buttonColor,
              enableFeedback: enableFeedback,
              foregroundColor: foregroundColor,
              surfaceTintColor: surfaceTintColor,
              animationDuration: animationDuration,
              backgroundBuilder: backgroundBuilder,
              disabledIconColor: disabledIconColor,
              foregroundBuilder: foregroundBuilder,
              disabledBackgroundColor: disabledColor,
              enabledMouseCursor: enabledMouseCursor,
              disabledMouseCursor: disabledMouseCursor,
              disabledForegroundColor: disabledForegroundColor),
          child: child);

  ButtonStyle buttonStyle(
      {Size? fixedSize,
      double? iconSize,
      BorderSide? side,
      Color? iconColor,
      Size? maximumSize,
      Size? minimumSize,
      double? elevation,
      Color? shadowColor,
      Color? overlayColor,
      bool? enableFeedback,
      TextStyle? textStyle,
      OutlinedBorder? shape,
      Color? foregroundColor,
      Color? backgroundColor,
      Color? surfaceTintColor,
      Color? disabledIconColor,
      EdgeInsetsGeometry? padding,
      Duration? animationDuration,
      AlignmentGeometry? alignment,
      VisualDensity? visualDensity,
      Color? disabledForegroundColor,
      Color? disabledBackgroundColor,
      MouseCursor? enabledMouseCursor,
      MouseCursor? disabledMouseCursor,
      MaterialTapTargetSize? tapTargetSize,
      InteractiveInkFeatureFactory? splashFactory,
      Widget Function(BuildContext, Set<WidgetState>, Widget?)?
          backgroundBuilder,
      Widget Function(BuildContext, Set<WidgetState>, Widget?)?
          foregroundBuilder}) {
    jot();
    switch (this) {
      case ButtonType.text:
        return TextButton.styleFrom(
            side: side,
            shape: shape,
            padding: padding,
            alignment: alignment,
            elevation: elevation,
            fixedSize: fixedSize,
            iconColor: iconColor,
            textStyle: textStyle,
            maximumSize: maximumSize,
            minimumSize: maximumSize,
            shadowColor: shadowColor,
            overlayColor: overlayColor,
            splashFactory: splashFactory,
            tapTargetSize: tapTargetSize,
            visualDensity: visualDensity,
            enableFeedback: enableFeedback,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            surfaceTintColor: surfaceTintColor,
            animationDuration: animationDuration,
            backgroundBuilder: backgroundBuilder,
            disabledIconColor: disabledIconColor,
            foregroundBuilder: foregroundBuilder,
            enabledMouseCursor: enabledMouseCursor,
            disabledMouseCursor: disabledMouseCursor,
            disabledForegroundColor: disabledForegroundColor,
            disabledBackgroundColor: disabledBackgroundColor);
      case ButtonType.border:
        return OutlinedButton.styleFrom(
            side: side,
            shape: shape,
            padding: padding,
            alignment: alignment,
            elevation: elevation,
            fixedSize: fixedSize,
            iconColor: iconColor,
            textStyle: textStyle,
            maximumSize: maximumSize,
            minimumSize: maximumSize,
            shadowColor: shadowColor,
            overlayColor: overlayColor,
            splashFactory: splashFactory,
            tapTargetSize: tapTargetSize,
            visualDensity: visualDensity,
            enableFeedback: enableFeedback,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            surfaceTintColor: surfaceTintColor,
            animationDuration: animationDuration,
            backgroundBuilder: backgroundBuilder,
            disabledIconColor: disabledIconColor,
            foregroundBuilder: foregroundBuilder,
            enabledMouseCursor: enabledMouseCursor,
            disabledMouseCursor: disabledMouseCursor,
            disabledForegroundColor: disabledForegroundColor,
            disabledBackgroundColor: disabledBackgroundColor);
      case ButtonType.raised:
        return ElevatedButton.styleFrom(
            side: side,
            shape: shape,
            padding: padding,
            alignment: alignment,
            elevation: elevation,
            fixedSize: fixedSize,
            iconColor: iconColor,
            textStyle: textStyle,
            maximumSize: maximumSize,
            minimumSize: maximumSize,
            shadowColor: shadowColor,
            overlayColor: overlayColor,
            splashFactory: splashFactory,
            tapTargetSize: tapTargetSize,
            visualDensity: visualDensity,
            enableFeedback: enableFeedback,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            surfaceTintColor: surfaceTintColor,
            animationDuration: animationDuration,
            backgroundBuilder: backgroundBuilder,
            disabledIconColor: disabledIconColor,
            foregroundBuilder: foregroundBuilder,
            enabledMouseCursor: enabledMouseCursor,
            disabledMouseCursor: disabledMouseCursor,
            disabledForegroundColor: disabledForegroundColor,
            disabledBackgroundColor: disabledBackgroundColor);
      default:
        return ButtonStyle(
            alignment: alignment,
            splashFactory: splashFactory,
            tapTargetSize: tapTargetSize,
            visualDensity: visualDensity,
            enableFeedback: enableFeedback,
            side: side?.allWidgetStateProperty<BorderSide?>(),
            iconSize: iconSize?.allWidgetStateProperty<double?>(),
            animationDuration: animationDuration,
            backgroundBuilder: backgroundBuilder,
            foregroundBuilder: foregroundBuilder,
            fixedSize: fixedSize?.allWidgetStateProperty<Size?>(),
            iconColor: iconColor?.allWidgetStateProperty<Color?>(),
            elevation: elevation?.allWidgetStateProperty<double?>(),
            shape: shape?.allWidgetStateProperty<OutlinedBorder?>(),
            maximumSize: maximumSize?.allWidgetStateProperty<Size?>(),
            minimumSize: maximumSize?.allWidgetStateProperty<Size?>(),
            shadowColor: shadowColor?.allWidgetStateProperty<Color?>(),
            textStyle: textStyle?.allWidgetStateProperty<TextStyle?>(),
            overlayColor: overlayColor?.allWidgetStateProperty<Color?>(),
            padding: padding?.allWidgetStateProperty<EdgeInsetsGeometry?>(),
            backgroundColor: backgroundColor?.allWidgetStateProperty<Color?>(),
            foregroundColor: foregroundColor?.allWidgetStateProperty<Color?>(),
            surfaceTintColor:
                surfaceTintColor?.allWidgetStateProperty<Color?>(),
            mouseCursor:
                enabledMouseCursor?.allWidgetStateProperty<MouseCursor?>());
    }
  }
}

extension Ext on XFile {
  File get file => File(path);

  Future<int> get size => length();

  Future<Uint8List> get bytes => readAsBytes();

  Future<DateTime> get lastModifiedDate => lastModified();

  Future<String> asString([Encoding? encoding]) =>
      readAsString(encoding: encoding ?? utf8);

  Widget imageBuilder1(
      {BoxFit? fit,
      Color? color,
      double? scale,
      double? width,
      double? height,
      int? cacheWidth,
      int? cacheHeight,
      Rect? centerSlice,
      bool? isAntiAlias,
      ImageRepeat? repeat,
      String? semanticLabel,
      bool? gaplessPlayback,
      bool? matchTextDirection,
      BlendMode? colorBlendMode,
      bool? excludeFromSemantics,
      Animation<double>? opacity,
      AlignmentGeometry? alignment,
      FilterQuality? filterQuality,
      Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
      Widget Function(BuildContext, Object, StackTrace?)? errorBuilder}) {
    return Image.file(file,
        fit: fit,
        width: width,
        color: color,
        height: height,
        opacity: opacity,
        scale: scale ?? 1.0,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        centerSlice: centerSlice,
        semanticLabel: semanticLabel,
        colorBlendMode: colorBlendMode,
        isAntiAlias: isAntiAlias ?? false,
        repeat: repeat ?? ImageRepeat.noRepeat,
        alignment: alignment ?? Alignment.center,
        gaplessPlayback: gaplessPlayback ?? false,
        frameBuilder: frameBuilder ?? getImageLoader,
        errorBuilder: errorBuilder ?? getErrorWidget,
        matchTextDirection: matchTextDirection ?? false,
        filterQuality: filterQuality ?? 'low'.filterQuality,
        excludeFromSemantics: excludeFromSemantics ?? false);
  }

  Widget imageBuilder2(
      {BoxFit? fit,
      Color? color,
      double? scale,
      double? width,
      double? height,
      int? cacheWidth,
      int? cacheHeight,
      Rect? centerSlice,
      bool? isAntiAlias,
      ImageRepeat? repeat,
      String? semanticLabel,
      bool? gaplessPlayback,
      bool? matchTextDirection,
      BlendMode? colorBlendMode,
      bool? excludeFromSemantics,
      Animation<double>? opacity,
      AlignmentGeometry? alignment,
      FilterQuality? filterQuality,
      Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
      Widget Function(BuildContext, Object, StackTrace?)? errorBuilder}) {
    Widget picBuilder(BuildContext context, AsyncSnapshot<Uint8List> list) {
      try {
        switch (list.connectionState) {
          case ConnectionState.done:
            if (list.hasData && !list.hasError) {
              return Image.memory(list.data!,
                  fit: fit,
                  width: width,
                  color: color,
                  height: height,
                  opacity: opacity,
                  scale: scale ?? 1.0,
                  cacheWidth: cacheWidth,
                  cacheHeight: cacheHeight,
                  centerSlice: centerSlice,
                  semanticLabel: semanticLabel,
                  colorBlendMode: colorBlendMode,
                  isAntiAlias: isAntiAlias ?? false,
                  repeat: repeat ?? ImageRepeat.noRepeat,
                  alignment: alignment ?? Alignment.center,
                  gaplessPlayback: gaplessPlayback ?? false,
                  frameBuilder: frameBuilder ?? getImageLoader,
                  errorBuilder: errorBuilder ?? getErrorWidget,
                  matchTextDirection: matchTextDirection ?? false,
                  filterQuality: filterQuality ?? 'low'.filterQuality,
                  excludeFromSemantics: excludeFromSemantics ?? false);
            } else if (list.hasError) {
              return list.error.string.textWidget();
            } else if (!list.hasData) {
              return 'No Data'.textWidget();
            } else {
              return const CircularLoader();
            }
          case ConnectionState.none:
            return const EmptyWidget();
          default:
            return const CircularLoader();
        }
      } catch (e) {
        e.jot();
        return const EmptyWidget();
      }
    }

    return FutureBuilder<Uint8List>(future: bytes, builder: picBuilder);
  }
}

extension Spares on Icon {
  IconButton iconButtonBuilder(
          {Key? key,
          Color? color,
          bool? autofocus,
          String? tooltip,
          bool? isSelected,
          double? iconSize,
          Color? focusColor,
          Color? hoverColor,
          ButtonStyle? style,
          Color? splashColor,
          Widget? selectedIcon,
          FocusNode? focusNode,
          double? splashRadius,
          Color? disabledColor,
          bool? enableFeedback,
          Color? highlightColor,
          VoidCallback? onPressed,
          MouseCursor? mouseCursor,
          EdgeInsetsGeometry? padding,
          BoxConstraints? constraints,
          AlignmentGeometry? alignment,
          VisualDensity? visualDensity}) =>
      IconButton(
          key: key,
          icon: this,
          color: color,
          style: style,
          padding: padding,
          tooltip: tooltip,
          iconSize: iconSize,
          alignment: alignment,
          focusNode: focusNode,
          onPressed: onPressed,
          isSelected: isSelected,
          focusColor: focusColor,
          hoverColor: hoverColor,
          constraints: constraints,
          mouseCursor: mouseCursor,
          splashColor: splashColor,
          selectedIcon: selectedIcon,
          splashRadius: splashRadius,
          visualDensity: visualDensity,
          autofocus: autofocus ?? false,
          enableFeedback: enableFeedback,
          highlightColor: highlightColor);
}

extension Usefullness on IconData? {
  Icon iconBuilder(
          {Key? key,
          Color? color,
          double? size,
          double? fill,
          double? weight,
          double? grade,
          double? opticalSize,
          List<Shadow>? shadows,
          String? semanticLabel,
          bool? applyTextScaling,
          TextDirection? textDirection}) =>
      Icon(this,
          key: key,
          fill: fill,
          grade: grade,
          color: color,
          weight: weight,
          shadows: shadows,
          opticalSize: opticalSize,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
          applyTextScaling: applyTextScaling);
}

extension Fut on Fraction {
  Widget getRatingWidget(
      {MainAxisSize? mainAxisSize,
      TextBaseline? textBaseline,
      TextDirection? textDirection,
      VerticalDirection? verticalDirection,
      MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment}) {
    if (numerator > denominator) {
      return const EmptyWidget();
    } else {
      final lw = numerator.lower, list = List<Icon>.generate(lw, obtainStar);
      if (numerator > lw) {
        list.add(Icons.star_half.iconBuilder(color: shades.kGold1));
      }
      list.addAll(List<Icon>.generate(
          denominator - lw - (numerator - lw).upper, obtainStarOutline));
      return Row(
          textBaseline: textBaseline,
          textDirection: textDirection,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          verticalDirection: verticalDirection ?? VerticalDirection.down,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: list);
    }
  }
}

extension Aid on Object? {
  Exception get error => Exception(this);

  String get string => toString().trimmed;

  WidgetStatePropertyAll<T> allWidgetStateProperty<T extends Object?>() =>
      WidgetStatePropertyAll<T>(this as T);

  String getEncoded([Object? Function(Object?)? toEncodable]) =>
      jsonEncode(this, toEncodable: toEncodable);

  void jot([bool? flag, int? wrapWidth]) {
    if (kDebugMode) {
      return (flag ?? false)
          ? debugPrint(string, wrapWidth: wrapWidth)
          : print(this);
    }
  }
}

extension Extra on Iterable<num> {
  double get mean => sum / length;

  bool get isSymmetric => mean == median;

  double get standardDeviation => isEmpty ? double.nan : variance.squareRoot;

  String getCharCodesToStr({int? start, int? end}) =>
      String.fromCharCodes(map<int>((num e) => e.integer), start ?? 0, end);

  Size get size => isEmpty || !<int>[1, 2].contains(length)
      ? Size.infinite
      : (length == 1
          ? Size.square(single.float)
          : Size(first.float, last.float));

  Offset get offset => isEmpty || length != 2
      ? Offset.infinite
      : Offset(first.float, last.float);

  Iterable<num> get distinctItems {
    final Map<num, int> freq = <num, int>{};
    for (num n in this) {
      if (freq.containsKey(n)) {
        freq[n] = (freq[n] ?? 0) + 1;
      } else {
        freq[n] = 1;
      }
    }
    return freq.keys;
  }

  num get mode {
    final Map<num, int> freq = <num, int>{};
    bool isMaxFreq(MapEntry<num, int> entry) {
      return entry.value == freq.values.largestNumber;
    }

    for (num n in this) {
      if (freq.containsKey(n)) {
        freq[n] = (freq[n] ?? 0) + 1;
      } else {
        freq[n] = 1;
      }
    }
    return freq.entries.firstWhere(isMaxFreq).key;
  }

  double get median {
    final List<num> ls = <num>[...this]..sort();
    switch (length % 2) {
      case 0:
        return (ls[(length - 2) ~/ 2] + ls[length ~/ 2]) / 2;
      case 1:
        return ls[(length - 1) ~/ 2].float;
      default:
        return double.nan;
    }
  }

  double get variance {
    num s = 0;
    for (num i in this) {
      s += (i - mean).square;
    }
    return isEmpty ? double.nan : s / length;
  }

  num get sum {
    if (isEmpty) {
      return '0'.toNum();
    } else {
      num s = 0;
      for (num i in this) {
        s += i;
      }
      return s;
    }
  }

  bool get hasOnlyZeroes {
    if (isEmpty) {
      return true;
    } else {
      bool val = true;
      for (num i in this) {
        if (i != 0) {
          val = false;
          break;
        } else {
          continue;
        }
      }
      return val;
    }
  }

  num get largestNumber {
    if (isEmpty) {
      return -1;
    } else if (length == 1) {
      return first;
    } else {
      num val = first;
      for (num i in this) {
        val = max(i, val);
      }
      return val;
    }
  }

  num get smallestNumber {
    if (isEmpty) {
      return -1;
    } else if (length == 1) {
      return first;
    } else {
      num val = first;
      for (num i in this) {
        val = min(i, val);
      }
      return val;
    }
  }

  num nthLargest(int n) {
    if (isEmpty || n == 0) {
      return '0'.toNum();
    } else if (length == 1) {
      return single;
    } else {
      final List<num> ls = <num>[...this]..sort();
      return ls[length - n];
    }
  }

  num nthSmallest(int n) {
    if (isEmpty || n == 0) {
      return '0'.toNum();
    } else if (length == 1) {
      return single;
    } else {
      final List<num> ls = <num>[...this]..sort();
      return ls[n - 1];
    }
  }
}

extension Benefit on DateTime {
  TimeOfDay get time => TimeOfDay.fromDateTime(this);

  bool get isToday => compareDateOnly(DateTime.now());

  bool get isCurrentYear => year == DateTime.now().year;

  bool get isYesterday =>
      compareDateOnly(DateTime.now().subtract(Duration(days: 1)));

  bool compareDateOnly(DateTime other) {
    return other.year == year && other.month == month && other.day == day;
  }

  bool isB4(DateTime other) {
    if (year < other.year) {
      return true;
    } else if (year == other.year) {
      return month == other.month ? day < other.day : month < other.month;
    } else {
      return false;
    }
  }

  bool hasPassed(DateTime other) {
    if (year > other.year) {
      return true;
    } else if (year == other.year) {
      return month == other.month ? day > other.day : month > other.month;
    } else {
      return false;
    }
  }

  bool compareDateAndTimeOnly(DateTime other) {
    return compareDateOnly(other) &&
        other.hour == hour &&
        other.minute == minute &&
        other.second == second;
  }

  String get horoscope {
    switch (month) {
      case DateTime.january:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
            return 'Capricornus';
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
            return 'Aquarius';
          default:
            return '';
        }
      case DateTime.february:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
            return 'Aquarius';
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
            return 'Pisces';
          default:
            return '';
        }
      case DateTime.march:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
            return 'Pisces';
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
            return 'Aries';
          default:
            return '';
        }
      case DateTime.april:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
            return 'Aries';
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
            return 'Taurus';
          default:
            return '';
        }
      case DateTime.may:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
            return 'Taurus';
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
            return 'Gemini';
          default:
            return '';
        }
      case DateTime.june:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            return 'Gemini';
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
            return 'Cancer';
          default:
            return '';
        }
      case DateTime.july:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
            return 'Cancer';
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
            return 'Leo';
          default:
            return '';
        }
      case DateTime.august:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
            return 'Leo';
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
            return 'Virgo';
          default:
            return '';
        }
      case DateTime.september:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
            return 'Virgo';
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
            return 'Libra';
          default:
            return '';
        }
      case DateTime.october:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
            return 'Libra';
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
            return 'Scorpius';
          default:
            return '';
        }
      case DateTime.november:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            return 'Scorpius';
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
            return 'Sagittarius';
          default:
            return '';
        }
      case DateTime.december:
        switch (day) {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            return 'Sagittarius';
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
            return 'Capricornus';
          default:
            return '';
        }
      default:
        return '';
    }
  }
}

extension Assist on Map<String, Object?> {
  AppConfig get appConfig => AppConfig.fromJson(this);

  Color get fromShadeMap {
    jot();
    return this['color'].string.getColorFromHex(this['alpha'].string);
  }

  FormData formData(
          [ListFormat? collectionFormat, bool? camelCaseContentDisposition]) =>
      FormData.fromMap(this, collectionFormat ?? ListFormat.multi,
          camelCaseContentDisposition ?? false);
}

extension Support on Size {
  Size get copied => Size.copy(this);

  bool get isTablet => isPortable && diagonal > 1100;

  bool get isMobile => isPortable && diagonal <= 1100;

  double get radius => (width.square + height.square).squareRoot;

  double get diagonal => (shortestSide.square + longestSide.square).squareRoot;

  SizedOverflowBox sizedOverflowBox(
          {Widget? child, AlignmentGeometry? alignment}) =>
      SizedOverflowBox(
          size: this, alignment: alignment ?? Alignment.center, child: child);
}

extension Tip on BoxConstraints {
  double get minRadius => minSize.radius;

  double get maxRadius => maxSize.radius;

  Size get minSize => Size(minWidth, minHeight);

  Size get maxSize => Size(maxWidth, maxHeight);

  Size get avgSize => Size(avgWidth, avgHeight);

  double get avgWidth => (minWidth + maxWidth) / 2;

  double get avgHeight => (minHeight + maxHeight) / 2;

  double get avgRadius => (minRadius + maxRadius) / 2;
}

extension Jury<T extends Widget> on Iterable<T>? {
  static final List<Widget> emptyWidgetList = <Widget>[];

  TabBarView bodyOfTabs(
          {Key? key,
          Clip? clip,
          ScrollPhysics? physics,
          double? viewportFraction,
          TabController? controller,
          DragStartBehavior? dragStartBehavior}) =>
      TabBarView(
          physics: physics,
          controller: controller,
          clipBehavior: clip ?? Clip.hardEdge,
          viewportFraction: viewportFraction ?? measurements.unit,
          dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
          children: this?.toList() ?? emptyWidgetList);

  Row placeWidgetsHorizontally(
          {Key? key,
          double? spacing,
          MainAxisSize? mainAxisSize,
          TextBaseline? textBaseline,
          TextDirection? textDirection,
          MainAxisAlignment? mainAxisAlignment,
          VerticalDirection? verticalDirection,
          CrossAxisAlignment? crossAxisAlignment}) =>
      Row(
          key: key,
          textBaseline: textBaseline,
          textDirection: textDirection,
          spacing: spacing ?? measurements.nilWb,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          verticalDirection: verticalDirection ?? VerticalDirection.down,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: this?.toList() ?? emptyWidgetList);

  Column placeWidgetsVertically(
          {Key? key,
          double? spacing,
          MainAxisSize? mainAxisSize,
          TextBaseline? textBaseline,
          TextDirection? textDirection,
          MainAxisAlignment? mainAxisAlignment,
          VerticalDirection? verticalDirection,
          CrossAxisAlignment? crossAxisAlignment}) =>
      Column(
          key: key,
          textBaseline: textBaseline,
          textDirection: textDirection,
          spacing: spacing ?? measurements.nilHt,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          verticalDirection: verticalDirection ?? VerticalDirection.down,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: this?.toList() ?? emptyWidgetList);

  TabBar placeWidgetsInTab(
          {Key? key,
          bool? secondary,
          bool? scrollable,
          Color? labelColor,
          Color? dividerColor,
          Color? overlayColor,
          bool? enableFeedback,
          IntegerChanged? onTap,
          double? dividerHeight,
          TextStyle? labelStyle,
          Decoration? indicator,
          Color? indicatorColor,
          ScrollPhysics? physics,
          TextScaler? textScaler,
          double? indicatorWeight,
          MouseCursor? mouseCursor,
          TabController? controller,
          TabAlignment? tabAlignment,
          EdgeInsetsGeometry? padding,
          Color? unselectedLabelColor,
          TextStyle? unselectedLabelStyle,
          BorderRadius? splashBorderRadius,
          EdgeInsetsGeometry? labelPadding,
          TabBarIndicatorSize? indicatorSize,
          DragStartBehavior? dragStartBehavior,
          EdgeInsetsGeometry? indicatorPadding,
          bool? automaticIndicatorColorAdjustment,
          TabIndicatorAnimation? indicatorAnimation,
          InteractiveInkFeatureFactory? splashFactory}) =>
      (secondary ?? false)
          ? TabBar.secondary(
              key: key,
              onTap: onTap,
              physics: physics,
              indicator: indicator,
              labelColor: labelColor,
              labelStyle: labelStyle,
              textScaler: textScaler,
              mouseCursor: mouseCursor,
              dividerColor: dividerColor,
              labelPadding: labelPadding,
              tabAlignment: tabAlignment,
              dividerHeight: dividerHeight,
              indicatorSize: indicatorSize,
              splashFactory: splashFactory,
              enableFeedback: enableFeedback,
              indicatorColor: indicatorColor,
              isScrollable: scrollable ?? false,
              indicatorAnimation: indicatorAnimation,
              splashBorderRadius: splashBorderRadius,
              tabs: this?.toList() ?? emptyWidgetList,
              unselectedLabelColor: unselectedLabelColor,
              unselectedLabelStyle: unselectedLabelStyle,
              indicatorPadding: indicatorPadding ?? css.zeroPadding,
              overlayColor: overlayColor?.allWidgetStateProperty<Color?>(),
              dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
              indicatorWeight:
                  indicatorWeight ?? measurements.customStepGranularity,
              automaticIndicatorColorAdjustment:
                  automaticIndicatorColorAdjustment ?? true)
          : TabBar(
              key: key,
              onTap: onTap,
              physics: physics,
              indicator: indicator,
              labelColor: labelColor,
              labelStyle: labelStyle,
              textScaler: textScaler,
              mouseCursor: mouseCursor,
              dividerColor: dividerColor,
              labelPadding: labelPadding,
              tabAlignment: tabAlignment,
              dividerHeight: dividerHeight,
              indicatorSize: indicatorSize,
              splashFactory: splashFactory,
              enableFeedback: enableFeedback,
              indicatorColor: indicatorColor,
              isScrollable: scrollable ?? false,
              indicatorAnimation: indicatorAnimation,
              splashBorderRadius: splashBorderRadius,
              tabs: this?.toList() ?? emptyWidgetList,
              unselectedLabelColor: unselectedLabelColor,
              unselectedLabelStyle: unselectedLabelStyle,
              indicatorPadding: indicatorPadding ?? css.zeroPadding,
              overlayColor: overlayColor?.allWidgetStateProperty<Color?>(),
              dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
              indicatorWeight:
                  indicatorWeight ?? measurements.customStepGranularity,
              automaticIndicatorColorAdjustment:
                  automaticIndicatorColorAdjustment ?? true);
}

extension Hand on ImageSource {
  bool get isSupported => mp.supportsImageSource(this);

  Future<XFile?> chooseMedium(
      {PickType? type,
      double? maxWidth,
      double? maxHeight,
      int? imageQuality,
      Duration? maxDuration,
      bool? requestFullMetadata,
      CameraDevice? preferredCameraDevice}) async {
    try {
      switch (type) {
        case PickType.image:
          return mp.pickImage(
              source: this,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: imageQuality,
              requestFullMetadata: requestFullMetadata ?? true,
              preferredCameraDevice:
                  preferredCameraDevice ?? CameraDevice.rear);
        case PickType.media:
          return mp.pickMedia(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: imageQuality,
              requestFullMetadata: requestFullMetadata ?? true);
        case PickType.video:
          return mp.pickVideo(
              source: this,
              maxDuration: maxDuration,
              preferredCameraDevice:
                  preferredCameraDevice ?? CameraDevice.rear);
        default:
          return null;
      }
    } catch (e) {
      e.jot();
      return null;
    }
  }
}

extension Avail<T extends num> on T {
  int get upper => ceil();

  int get lower => floor();

  num get absolute => abs();

  int get approx => round();

  int get integer => toInt();

  double get float => toDouble();

  int get truncated => truncate();

  double get up => ceilToDouble();

  double get sine => sin(radians);

  num get cube => toThePowerOf(3);

  num get square => toThePowerOf(2);

  double get cosine => cos(radians);

  double get low => floorToDouble();

  double get logarithm => log(this);

  double get tangent => tan(radians);

  double get cosInverse => acos(this);

  double get tanInverse => atan(this);

  double get squareRoot => sqrt(this);

  double get sineInverse => asin(this);

  num get degrees => (this * 180) / pi;

  num get radians => (this * pi) / 180;

  Fraction get fraction => toFraction();

  BigInt get bigInt => BigInt.from(this);

  double get approximate => roundToDouble();

  num toThePowerOf(num exp) => pow(this, exp);

  double get truncatedDouble => truncateToDouble();

  double tanInverseOfQuotientOf(num other) => atan2(this, other);

  Offset offsetFromRadians([double? distance]) =>
      Offset.fromDirection(radians.float, distance ?? 1.0);

  Transform rotatedTransform(
          {Widget? child,
          Offset? origin,
          bool? transformHitTests,
          AlignmentGeometry? alignment,
          FilterQuality? filterQuality}) =>
      Transform.rotate(
          origin: origin,
          angle: radians.float,
          filterQuality: filterQuality,
          alignment: alignment ?? Alignment.center,
          transformHitTests: transformHitTests ?? true,
          child: child);

  bool get isPerfectSquare {
    bool isSquare = this > 0.0;
    switch (runtimeType) {
      case const (int):
        isSquare = isSquare && squareRoot * squareRoot == this;
        break;
      case const (double):
        final List<String> arrSplit = string.split('.');
        isSquare = isSquare &&
            arrSplit.last.length.isEven &&
            arrSplit.join().toInt().isPerfectSquare;
        break;
    }
    return isSquare;
  }
}

extension Help on int {
  Color get color => Color(this);

  bool get isPalindrome => reversed == this;

  String get charCodeToStr => String.fromCharCode(this);

  bool get eitherZeroOrOne => <int>[0, 1].contains(this);

  Icon get filledStar => Icons.star.iconBuilder(color: shades.kGold1);

  bool get isAdam => square.integer == reversed.square.integer.reversed;

  Icon get outlinedStar => Icons.star_border.iconBuilder(color: shades.kGold1);

  MaterialColor getMaterialColor(Map<int, Color> swatch) =>
      MaterialColor(this, swatch);

  MaterialAccentColor getMaterialAccentColor(Map<int, Color> swatch) =>
      MaterialAccentColor(this, swatch);

  TrainBerth? get berth {
    if (this <= 0 && this >= 73) {
      return null;
    } else {
      switch (this % 8) {
        case 3:
        case 6:
          return TrainBerth.upper;
        case 1:
        case 4:
          return TrainBerth.lower;
        case 2:
        case 5:
          return TrainBerth.middle;
        case 0:
          return TrainBerth.sideUpper;
        case 7:
          return TrainBerth.sideLower;
        default:
          return null;
      }
    }
  }

  bool get isFibonacci =>
      (5 * this * this + 4).isPerfectSquare ||
      (5 * this * this - 4).isPerfectSquare;

  int get nthFibonacci => eitherZeroOrOne
      ? this
      : ((this - 1).nthFibonacci + (this - 2).nthFibonacci);

  DateTime getDateFromMilli([bool? isUtc]) =>
      DateTime.fromMillisecondsSinceEpoch(this, isUtc: isUtc ?? false);

  DateTime getDateFromMicro([bool? isUtc]) =>
      DateTime.fromMicrosecondsSinceEpoch(this, isUtc: isUtc ?? false);

  String get ordinal {
    switch (this % 10) {
      case 1:
        return '$this${this ~/ 10 == 1 ? "th" : "st"}';
      case 2:
        return '$this${this ~/ 10 == 1 ? "th" : "nd"}';
      case 3:
        return '$this${this ~/ 10 == 1 ? "th" : "rd"}';
      default:
        return '${this}th';
    }
  }

  bool get isArmstrong {
    int om = 0, curNum = this;
    while (curNum != 0) {
      om += (curNum % 10).cube.integer;
      curNum ~/= 10;
    }
    return om == this;
  }

  bool get isUnique {
    int om = 0, curNum = this;
    while (curNum != 0) {
      om += (curNum % 10).square.integer;
      curNum ~/= 10;
    }
    return om == this;
  }

  int get reversed {
    int om = 0, curNum = this;
    while (curNum != 0) {
      om = (om * 10) + (curNum % 10);
      curNum ~/= 10;
    }
    return om;
  }

  bool get isStrong {
    int om = 0, curNum = this;
    while (curNum != 0) {
      om += (curNum % 10).factorial;
      curNum = curNum ~/ 10;
    }
    return om == this;
  }

  bool get isPerfect {
    int sum = 0;
    for (int i = 1; i < this; i++) {
      if (this % i == 0) {
        sum += i;
      }
    }
    return sum == this;
  }

  int get factorial {
    if (this < 0) {
      return 0;
    } else if (eitherZeroOrOne) {
      return 1;
    } else {
      return this * (this - 1).factorial;
    }
  }

  bool get isPrime {
    if (this < 2) {
      return false;
    } else {
      bool flag = true;
      for (int i = 2; i <= squareRoot.lower; i++) {
        if (this % i == 0) {
          flag = false;
          break;
        }
      }
      return flag;
    }
  }

  String get creditCardNumber {
    final String n2s = absolute.string;
    return this >= 10.toThePowerOf(15).integer && n2s.length == 16
        ? '${n2s.substring(0, 4)} ${n2s.substring(4, 8)} ${n2s.substring(8, 12)} ${n2s.substring(12, 16)}'
        : '';
  }

  int largestFactorUnderN([int n = 10]) {
    int fact = 1;
    final int lt = n - (this < n ? 0 : 1);
    for (int i = 2; i < this; i++) {
      if (i > lt) {
        break;
      } else if (this % i == 0) {
        fact = i;
      } else {
        continue;
      }
    }
    return fact;
  }

  DateTime getDate(
          {int? day,
          int? hour,
          int? month,
          int? minute,
          int? second,
          int? millisecond,
          int? microsecond}) =>
      DateTime(this, month ?? 1, day ?? 1, hour ?? 0, minute ?? 0, second ?? 0,
          millisecond ?? 0, microsecond ?? 0);

  DateTime getUTCDate(
          {int? day,
          int? hour,
          int? month,
          int? minute,
          int? second,
          int? millisecond,
          int? microsecond}) =>
      DateTime.utc(this, month ?? 1, day ?? 1, hour ?? 0, minute ?? 0,
          second ?? 0, millisecond ?? 0, microsecond ?? 0);
}

extension PlaceUtils on LatLng {
  CameraUpdate get cameraUpdate => CameraUpdate.newLatLng(this);

  PointLatLng get pointLatLng => PointLatLng(latitude, longitude);

  Future<List<Placemark>> get places =>
      placemarkFromCoordinates(latitude, longitude);

  bool verifyDistance(LatLng other) =>
      distanceTo(other) == haversineDistanceTo(other);

  Map<String, double> get map =>
      <String, double>{'longitude': longitude, 'latitude': latitude};

  Location get loc => Location(
      latitude: latitude, longitude: longitude, timestamp: DateTime.now());

  double getBearingBetween(LatLng other) =>
      gl.bearingBetween(latitude, longitude, other.latitude, other.longitude);

  double distanceTo(LatLng other) =>
      gl.distanceBetween(latitude, longitude, other.latitude, other.longitude) /
      1000;

  CameraPosition cameraPosition(
          {double? tilt, double? zoom, double? bearing}) =>
      CameraPosition(
          target: this,
          tilt: tilt ?? 0.0,
          zoom: zoom ?? 0.0,
          bearing: bearing ?? 0.0);

  double get earthRadius {
    final num eqRadSq =
            'earth_equator_radius'.valFromConfig<String>()?.toDouble().square ??
                0.0,
        poleRadSq =
            'earth_polar_radius'.valFromConfig<String>()?.toDouble().square ??
                0.0,
        poleRad4 = poleRadSq.square,
        latCosSq = latitude.cosine.square,
        v1 = (eqRadSq.square - poleRad4) * latCosSq,
        v2 = (eqRadSq - poleRadSq) * latCosSq;
    return ((v1 + poleRad4) / (v2 + poleRadSq)).absolute.squareRoot;
  }

  double getAngle(LatLng other) {
    final dLon = (other.longitude - longitude).absolute,
        y = dLon.sine * other.longitude.cosine,
        x = latitude.cosine * other.latitude.sine -
            latitude.sine * other.latitude.cosine * dLon.cosine;
    return y.tanInverseOfQuotientOf(x);
  }

  double haversineDistanceTo(LatLng other) {
    final sLat = (other.latitude + latitude),
        dLat = (other.latitude - latitude).absolute,
        dLong = (other.longitude - longitude).absolute,
        v1 = 1 + sLat.cosine,
        v2 = 1 - sLat.cosine,
        v3 = (dLat.cosine + sLat.cosine) * dLong.cosine;
    return ((earthRadius + other.earthRadius) *
        ((v1 - v3) / (v2 + v3)).absolute.squareRoot.tanInverse);
  }

  DateTime get dateTime {
    DateTime dt = DateTime.now().toUtc();
    final Duration dur = Duration(
        hours: longitude.wholeNumber ~/ 15,
        minutes: (4 * (longitude.wholeNumber % 15)) +
            (longitude.decimalPart * 4).wholeNumber,
        seconds: ((longitude.decimalPart * 4).decimalPart * 60).wholeNumber,
        milliseconds:
            (((longitude.decimalPart * 4).decimalPart * 60).decimalPart * 1000)
                .wholeNumber,
        microseconds:
            ((((longitude.decimalPart * 4).decimalPart * 60).decimalPart * 1000)
                        .decimalPart *
                    1000)
                .wholeNumber);
    if (longitude > 0) {
      dt = dt.add(dur);
    } else if (longitude < 0) {
      dt = dt.subtract(dur);
    } else {}
    return dt;
  }
}

extension Services on TimeOfDay {
  String get time {
    final String trailingZeroHour = hour.toString().length == 1 ? '0' : '',
        trailingZeroMinute = minute.toString().length == 1 ? '0' : '';
    return '$trailingZeroHour$hour:$trailingZeroMinute$minute';
  }

  String get timeWithMeridiem {
    if (hour < 12) {
      final hr = hour == 0 ? 12 : hour,
          trailingZeroHour = hr.string.length == 1 ? '0' : '',
          trailingZeroMinute = minute.string.length == 1 ? '0' : '';
      return '$trailingZeroHour$hr:$trailingZeroMinute$minute AM';
    } else {
      final hr = hour == 12 ? hour : hour - 12,
          trailingZeroHour = hr.string.length == 1 ? '0' : '',
          trailingZeroMinute = minute.string.length == 1 ? '0' : '';
      return '$trailingZeroHour$hr:$trailingZeroMinute$minute PM';
    }
  }

  bool equals(TimeOfDay other) {
    return hour == other.hour && minute == other.minute;
  }
}

extension Utils on String {
  File get file => File(trimmed);

  String get trimmed {
    final String ip = this;
    return ip.trim();
  }

  String get lowerCased {
    final String ip = this;
    return ip.toLowerCase();
  }

  String get upperCased {
    final String ip = this;
    return ip.toUpperCase();
  }

  String get firstLetterCapitalized {
    final String ip = this;
    return ip[0].upperCased + ip.substring(1).lowerCased;
  }

  MarkerId get markerID => MarkerId(trimmed);

  Uint8List get bytes => base64.decode(trimmed);

  String get dateWithF2 => fmd1.format(dateTime);

  Uint8List get listData => base64Decode(trimmed);

  bool get hasEnv => bool.hasEnvironment(trimmed);

  String get fileExtension => split('.').last.trimmed;

  Fraction get fraction => Fraction.fromString(trimmed);

  String get currencySymbol => nf.simpleCurrencySymbol(this);

  List<PointLatLng> get points => mpp.decodePolyline(trimmed);

  bool get isFromAsset => r'assets'.getRE().hasMatch(trimmed);

  bool get isFromServer => r'https'.getRE().hasMatch(trimmed);

  T? valFromConfig<T extends Object?>() => gc?.getValue<T>(trimmed);

  Future<List<Location>> get locations => locationFromAddress(trimmed);

  Locale getLocale({String? countrycode}) => Locale(this, countrycode);

  Future<List<Placemark>> get places => gco.placemarkFromAddress(trimmed);

  num toNum([num? orElse]) => num.tryParse(trimmed) ?? (orElse ?? toDouble());

  Future<GlobalConfiguration> get configFromAsset =>
      GlobalConfiguration().loadFromAsset(this);

  Future<GlobalConfiguration> get configFromPath =>
      GlobalConfiguration().loadFromPath(this);

  Uri toUri({int? start, int? end}) =>
      Uri.tryParse(trimmed, start ?? 0, end) ?? Uri();

  Future<ByteData> get byteData => rootBundle.load(trimmed);

  Future<String> loadFromAssets([bool? cache]) =>
      rootBundle.loadString(trimmed, cache: cache ?? true);

  double toDouble([double? orElse]) =>
      double.tryParse(trimmed) ?? (orElse ?? double.nan);

  int toInt([int? radix, int? orElse]) =>
      int.tryParse(trimmed, radix: radix) ?? (orElse ?? -1);

  Future<LocationAccuracyStatus> get temporaryHighAccuracy =>
      gl.requestTemporaryFullAccuracy(purposeKey: trimmed);

  dynamic getDecoded([Object? Function(Object?, Object?)? reviver]) =>
      jsonDecode(trimmed, reviver: reviver);

  int numberFromEnv([int? defaultVal]) =>
      int.fromEnvironment(trimmed, defaultValue: defaultVal ?? 0);

  String stringFromEnv([String? defaultVal]) =>
      String.fromEnvironment(trimmed, defaultValue: defaultVal ?? '');

  PolylineWayPoint toWayPoint({bool? stopOver}) =>
      PolylineWayPoint(location: trimmed, stopOver: stopOver ?? true);

  bool flagFromEnv([bool? defaultVal]) =>
      bool.fromEnvironment(trimmed, defaultValue: defaultVal ?? false);

  bool get isVideo => <String>['avi', 'mp4', 'mov', 'hevc', 'flv', 'mkv']
      .contains(fileExtension);

  bool get isImage =>
      <String>['jpg', 'jpeg', 'png', 'svg', 'gif'].contains(fileExtension);

  bool get isSvg => fileExtension == 'svg';

  bool toBool([bool? isCaseSensitive]) =>
      bool.tryParse(trimmed, caseSensitive: isCaseSensitive ?? true) ?? false;

  bool Function(Route<dynamic>) get popDestination =>
      ModalRoute.withName(trimmed);

  bool get isValidEmail =>
      mailExp.hasMatch(trimmed) && mailExp.allMatches(trimmed).length == 1;

  TextTheme getTextThemeFromFontFamily([TextTheme? textTheme]) =>
      GoogleFonts.getTextTheme(trimmed.firstLetterCapitalized, textTheme);

  bool get isValidName => trimmed.isNotEmpty
      // && trimmed.length >= minimumUserNameLength
      //  &&
      // nameExp.hasMatch(trimmed)
      ;

  bool get isValidPassword =>
      trimmed.isNotEmpty &&
      trimmed.length >= minPwdLth &&
      trimmed.length <= maxPwdLth &&
      pwdExp.hasMatch(trimmed);

  bool get isAudio => <String>[
        'mp3',
        'wav',
        'aac',
        'm4a',
        'flac',
        'wma',
        'midi',
        'mod'
      ].contains(fileExtension);

  MethodChannel getMethodChannel(
          {MethodCodec? codec, BinaryMessenger? binaryMessenger}) =>
      MethodChannel(
          trimmed, codec ?? const StandardMethodCodec(), binaryMessenger);

  Uri get url {
    final String base = apiMode.name.valFromConfig<String>()?.trimmed ?? '';
    return "$base${base.endsWith("/") ? '' : '/'}$trimmed".toUri();
  }

  String limitString({int? limit, String? hiddenText}) {
    final lt = limit ?? 24, ht = hiddenText ?? '...';
    return trimmed.isEmpty
        ? ''
        : trimmed.substring(0, min<int>(lt, length)) + (length > lt ? ht : '');
  }

  String get firstAndLastName => trimmed.isEmpty
      ? ''
      : trimmed
          .split(' ')
          .where((String element) => <int>[0, trimmed.split(' ').length - 1]
              .contains(trimmed.split(' ').indexOf(element)))
          .toList()
          .join(' ');

  bool get toFlag {
    final List<String> values = <String>['true', 'yes', 'ok', 'good', 'fine'];
    return trimmed.isNotEmpty &&
        (values.contains(trimmed.lowerCased) ||
            values
                .map<String>((String e) => e.trimmed.upperCased)
                .contains(trimmed.upperCased) ||
            toInt(null, 0) > 0);
  }

  bool get isImagePath {
    bool result = false;
    for (String element in <String>[
      'images',
      'imgs',
      'img',
      'image',
      'pics',
      'pictures'
    ]) {
      if (trimmed.contains(element) ||
          element.getRE().hasMatch(trimmed) ||
          trimmed.isImage) {
        result = true;
        break;
      } else {
        continue;
      }
    }
    return result;
  }

  Future<bool> get removeLocalStorageKey async {
    final SharedPreferences prefs = await sharedPrefs;
    return prefs.remove(this);
  }

  Future<bool> validate(
          [AuthenticationOptions? options,
          Iterable<AuthMessages>? authMessages]) =>
      la.confirm(this, options, authMessages);

  getFromYAML({bool? recover, Uri? sourceUrl, ErrorListener? errorListener}) =>
      loadYaml(this,
          sourceUrl: sourceUrl,
          recover: recover ?? false,
          errorListener: errorListener);

  RegExp getRE(
          {bool? dotAll,
          bool? unicode,
          bool? multiLine,
          bool? caseSensitive}) =>
      RegExp(this,
          dotAll: dotAll ?? false,
          unicode: unicode ?? false,
          multiLine: multiLine ?? false,
          caseSensitive: caseSensitive ?? true);

  Future<Uint8List?> getBytesFromAsset({int? width, int? height}) async {
    final ByteData data = await byteData;
    final codec = await data.buffer
        .asUint8List()
        .setImageCodec(targetWidth: width, targetHeight: height);
    final FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  String getCommonPattern(String other) {
    List<int> generator(int i) {
      return List<int>.filled(other.length + 1, 0);
    }

    int z = 0;
    List<String> ret = <String>[];
    final List<List<int>> l = List.generate(length + 1, generator);

    for (int i = 1; i <= length; i++) {
      for (int j = 1; j <= other.length; j++) {
        if (this[i - 1] == other[j - 1]) {
          l[i][j] = (i == 1 || j == 1 ? 0 : l[i - 1][j - 1]) + 1;
          if (l[i][j] > z) {
            z = l[i][j];
            ret = <String>[substring(i - z, i)];
          } else if (l[i][j] == z) {
            ret.add(substring(i - z, i));
          }
        } else {
          l[i][j] = 0;
        }
      }
    }
    ret.jot();
    return ret.singleOrNull ?? '';
  }

  Widget getImageFromAssetOrNetwork(
          {Key? key,
          BoxFit? fit,
          Color? color,
          double? scale,
          double? width,
          double? height,
          SvgTheme? theme,
          String? package,
          int? cacheWidth,
          int? cacheHeight,
          bool? isAntiAlias,
          Rect? centerSlice,
          Clip? clipBehavior,
          Client? httpClient,
          ImageRepeat? repeat,
          AssetBundle? bundle,
          BlendMode? blendMode,
          String? semanticLabel,
          bool? gaplessPlayback,
          ColorFilter? colorFilter,
          bool? matchTextDirection,
          BlendMode? colorBlendMode,
          Animation<double>? opacity,
          bool? excludeFromSemantics,
          FilterQuality? filterQuality,
          AlignmentGeometry? alignment,
          Map<String, String>? headers,
          bool? allowDrawingOutsideViewBox,
          WidgetBuilder? placeHolder,
          Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
          Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
          Widget Function(BuildContext, Widget, ImageChunkEvent?)?
              loadingBuilder}) =>
      isSvg
          ? (isFromServer
              ? SvgPicture.network(trimmed,
                  key: key,
                  theme: theme,
                  width: width,
                  height: height,
                  headers: headers,
                  httpClient: httpClient,
                  colorFilter: colorFilter,
                  fit: fit ?? BoxFit.contain,
                  semanticsLabel: semanticLabel,
                  placeholderBuilder: placeHolder,
                  alignment: alignment ?? Alignment.center,
                  clipBehavior: clipBehavior ?? Clip.hardEdge,
                  matchTextDirection: matchTextDirection ?? false,
                  excludeFromSemantics: excludeFromSemantics ?? false,
                  allowDrawingOutsideViewBox:
                      allowDrawingOutsideViewBox ?? false)
              : SvgPicture.asset(trimmed,
                  key: key,
                  theme: theme,
                  width: width,
                  bundle: bundle,
                  height: height,
                  package: package,
                  colorFilter: colorFilter,
                  fit: fit ?? BoxFit.contain,
                  semanticsLabel: semanticLabel,
                  placeholderBuilder: placeHolder,
                  alignment: alignment ?? Alignment.center,
                  clipBehavior: clipBehavior ?? Clip.hardEdge,
                  matchTextDirection: matchTextDirection ?? false,
                  excludeFromSemantics: excludeFromSemantics ?? false,
                  allowDrawingOutsideViewBox:
                      allowDrawingOutsideViewBox ?? false))
          : (isFromServer
              ? Image.network(trimmed,
                  fit: fit,
                  key: key,
                  width: width,
                  color: color,
                  height: height,
                  headers: headers,
                  opacity: opacity,
                  cacheWidth: cacheWidth,
                  centerSlice: centerSlice,
                  cacheHeight: cacheHeight,
                  errorBuilder: errorBuilder,
                  frameBuilder: frameBuilder,
                  semanticLabel: semanticLabel,
                  colorBlendMode: colorBlendMode,
                  loadingBuilder: loadingBuilder,
                  isAntiAlias: isAntiAlias ?? false,
                  scale: scale ?? measurements.unit,
                  repeat: repeat ?? ImageRepeat.noRepeat,
                  alignment: alignment ?? Alignment.center,
                  gaplessPlayback: gaplessPlayback ?? false,
                  matchTextDirection: matchTextDirection ?? false,
                  filterQuality: filterQuality ?? 'low'.filterQuality,
                  excludeFromSemantics: excludeFromSemantics ?? false)
              : Image.asset(trimmed,
                  fit: fit,
                  key: key,
                  width: width,
                  scale: scale,
                  color: color,
                  bundle: bundle,
                  height: height,
                  opacity: opacity,
                  package: package,
                  cacheWidth: cacheWidth,
                  centerSlice: centerSlice,
                  cacheHeight: cacheHeight,
                  errorBuilder: errorBuilder,
                  frameBuilder: frameBuilder,
                  semanticLabel: semanticLabel,
                  colorBlendMode: colorBlendMode,
                  isAntiAlias: isAntiAlias ?? false,
                  repeat: repeat ?? ImageRepeat.noRepeat,
                  alignment: alignment ?? Alignment.center,
                  gaplessPlayback: gaplessPlayback ?? false,
                  matchTextDirection: matchTextDirection ?? false,
                  filterQuality: filterQuality ?? 'low'.filterQuality,
                  excludeFromSemantics: excludeFromSemantics ?? false));

  CrossAxisAlignment? get caa {
    switch (lowerCased.trimmed) {
      case 'end':
      case 'last':
        return CrossAxisAlignment.end;
      case 'middle':
      case 'center':
        return CrossAxisAlignment.center;
      case 'stretch':
      case 'elongate':
        return CrossAxisAlignment.stretch;
      case 'start':
      case 'begin':
      case 'first':
        return CrossAxisAlignment.start;
      case 'baseline':
        return CrossAxisAlignment.baseline;
      default:
        return null;
    }
  }

  MainAxisAlignment? get maa {
    switch (lowerCased.trimmed) {
      case 'end':
      case 'last':
        return MainAxisAlignment.end;
      case 'middle':
      case 'center':
        return MainAxisAlignment.center;
      case 'spacearound':
      case 'space-around':
        return MainAxisAlignment.spaceAround;
      case 'start':
      case 'begin':
      case 'first':
        return MainAxisAlignment.start;
      case 'spacebetween':
      case 'space-between':
        return MainAxisAlignment.spaceBetween;
      case 'spaceeven':
      case 'space-even':
      case 'spaceevenly':
      case 'space-evenly':
        return MainAxisAlignment.spaceEvenly;
      default:
        return null;
    }
  }

  PickType? get pickType {
    switch (lowerCased.trimmed) {
      case 'media':
        return PickType.media;
      case 'video':
        return PickType.video;
      case 'pic':
      case 'image':
      case 'photo':
      case 'picture':
      case 'photograph':
        return PickType.image;
      default:
        return null;
    }
  }

  ButtonType? get buttonType {
    switch (trimmed.lowerCased) {
      case 'text':
      case 'flat':
        return ButtonType.text;
      case 'border':
      case 'outline':
      case 'bordered':
      case 'outlined':
        return ButtonType.border;
      case 'raised':
      case 'elevated':
        return ButtonType.raised;
      default:
        return null;
    }
  }

  FontWeight? get fontWeight {
    switch (trimmed.lowerCased) {
      case 'bold':
        return FontWeight.bold;
      case 'thin':
        return FontWeight.w100;
      case 'xtralyt':
      case 'xtra-lyt':
      case 'xtralight':
      case 'xtra-light':
      case 'extralight':
      case 'extra-light':
        return FontWeight.w200;
      case 'lyt':
      case 'light':
        return FontWeight.w300;
      case 'regular':
        return FontWeight.w400;
      case 'medium':
        return FontWeight.w500;
      case 'semibold':
      case 'semi-bold':
        return FontWeight.w600;
      case 'xtrabold':
      case 'xtra-bold':
      case 'extrabold':
      case 'extra-bold':
        return FontWeight.w800;
      case 'black':
        return FontWeight.w900;
      case 'normal':
        return FontWeight.normal;
      default:
        return null;
    }
  }

  TextAlign? get textAlign {
    switch (trimmed.lowerCased) {
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'end':
      case 'last':
        return TextAlign.end;
      case 'start':
      case 'begin':
        return TextAlign.start;
      case 'center':
      case 'middle':
        return TextAlign.center;
      case 'justify':
      case 'justified':
        return TextAlign.justify;
      default:
        return null;
    }
  }

  TextCapitalization get textCapitalization {
    switch (trimmed.lowerCased) {
      case 'word':
      case 'words':
        return TextCapitalization.words;
      case 'sentence':
      case 'sentences':
        return TextCapitalization.sentences;
      case 'character':
      case 'characters':
        return TextCapitalization.characters;
      case 'null':
      case 'none':
      default:
        return TextCapitalization.none;
    }
  }

  BoxFit get boxFit {
    switch (trimmed.lowerCased) {
      case 'fill':
      case 'filled':
        return BoxFit.fill;
      case 'cover':
      case 'covered':
        return BoxFit.cover;
      case 'contain':
      case 'contained':
        return BoxFit.contain;
      case 'fw':
      case 'width':
      case 'fitwidth':
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'fh':
      case 'height':
      case 'fitheight':
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'sd':
      case 'down':
      case 'scaledown':
      case 'scale_down':
        return BoxFit.scaleDown;
      case 'none':
      case 'nill':
      case 'null':
      default:
        return BoxFit.none;
    }
  }

  AlignmentDirectional? get alignmentDirectional {
    switch (trimmed.lowerCased) {
      case 'top_end':
        return AlignmentDirectional.topEnd;
      case 'top_start':
        return AlignmentDirectional.topStart;
      case 'top_center':
        return AlignmentDirectional.topCenter;
      case 'center':
        return AlignmentDirectional.topCenter;
      case 'center_end':
        return AlignmentDirectional.centerEnd;
      case 'bottom_end':
        return AlignmentDirectional.bottomEnd;
      case 'center_start':
        return AlignmentDirectional.centerStart;
      case 'bottom_start':
        return AlignmentDirectional.bottomStart;
      case 'bottom_center':
        return AlignmentDirectional.bottomCenter;
      default:
        return null;
    }
  }

  FilterQuality get filterQuality {
    switch (trimmed.lowerCased) {
      case 'big':
      case 'high':
      case 'more':
        return FilterQuality.high;
      case 'low':
      case 'less':
      case 'small':
        return FilterQuality.low;
      case 'middle':
      case 'medium':
      case 'average':
        return FilterQuality.medium;
      case 'null':
      case 'none':
      default:
        return FilterQuality.none;
    }
  }

  ReadMoreText readMore(
          {Key? key,
          Locale? locale,
          int? trimLines,
          int? trimLength,
          TextStyle? style,
          String? delimiter,
          TrimMode? trimMode,
          bool? isExpandable,
          String? preDataText,
          String? postDataText,
          TextAlign? textAlign,
          TextStyle? moreStyle,
          TextStyle? lessStyle,
          TextScaler? textScaler,
          String? semanticsLabel,
          String? trimExpandedText,
          Color? colorClickableText,
          TextStyle? delimiterStyle,
          String? trimCollapsedText,
          TextStyle? preDataTextStyle,
          TextStyle? postDataTextStyle,
          TextDirection? textDirection,
          List<Annotation>? annotations,
          ValueNotifier<bool>? isCollapsed}) =>
      ReadMoreText(this,
          key: key,
          style: style,
          locale: locale,
          lessStyle: lessStyle,
          moreStyle: moreStyle,
          textAlign: textAlign,
          textScaler: textScaler,
          annotations: annotations,
          isCollapsed: isCollapsed,
          preDataText: preDataText,
          trimLines: trimLines ?? 2,
          postDataText: postDataText,
          textDirection: textDirection,
          trimLength: trimLength ?? 240,
          delimiterStyle: delimiterStyle,
          semanticsLabel: semanticsLabel,
          delimiter: delimiter ?? '\u2026',
          isExpandable: isExpandable ?? true,
          preDataTextStyle: preDataTextStyle,
          postDataTextStyle: postDataTextStyle,
          trimMode: trimMode ?? TrimMode.Length,
          colorClickableText: colorClickableText,
          trimExpandedText: trimExpandedText ?? 'show less',
          trimCollapsedText: trimCollapsedText ?? 'read more');

  AutoSizeText autoSize(
          {Key? key,
          Key? textKey,
          int? maxLines,
          Locale? locale,
          bool? softWrap,
          bool? wrapWords,
          TextStyle? style,
          double? maxFontSize,
          double? minFontSize,
          AutoSizeGroup? group,
          TextAlign? textAlign,
          String? semanticsLabel,
          StrutStyle? strutStyle,
          TextOverflow? overflow,
          double? stepGranularity,
          double? textScaleFactor,
          Widget? overflowReplacement,
          TextDirection? textDirection,
          List<double>? presetFontSizes}) =>
      AutoSizeText(this,
          key: key,
          style: style,
          group: group,
          locale: locale,
          textKey: textKey,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
          textAlign: textAlign,
          strutStyle: strutStyle,
          wrapWords: wrapWords ?? true,
          textDirection: textDirection,
          semanticsLabel: semanticsLabel,
          presetFontSizes: presetFontSizes,
          textScaleFactor: textScaleFactor,
          overflowReplacement: overflowReplacement,
          maxFontSize: maxFontSize ?? double.infinity,
          minFontSize: minFontSize ?? measurements.normal,
          stepGranularity: stepGranularity ?? measurements.unit);

  Text textWidget(
          {Key? key,
          int? maxLines,
          Locale? locale,
          bool? softWrap,
          TextStyle? style,
          TextAlign? textAlign,
          Color? selectionColor,
          TextScaler? textScaler,
          String? semanticsLabel,
          StrutStyle? strutStyle,
          TextOverflow? overflow,
          TextDirection? textDirection,
          TextWidthBasis? textWidthBasis,
          TextHeightBehavior? textHeightBehavior}) =>
      Text(this,
          key: key,
          style: style,
          locale: locale,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
          textAlign: textAlign,
          textScaler: textScaler,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textWidthBasis: textWidthBasis,
          semanticsLabel: semanticsLabel,
          selectionColor: selectionColor,
          textHeightBehavior: textHeightBehavior);

  DateTime get dateTime {
    final RegExp re1 = r'-'.getRE(), re2 = r'/'.getRE(), re3 = r'.'.getRE();
    if (trimmed.isEmpty) {
      return DateTime.now();
    } else if (re1.hasMatch(trimmed) && re1.allMatches(trimmed).length == 2) {
      return DateTime.tryParse(trimmed) ?? DateTime.now();
    } else if (re2.hasMatch(trimmed) && re2.allMatches(trimmed).length == 2) {
      return DateTime.tryParse(trimmed.replaceAll('/', '-')) ?? DateTime.now();
    } else if (re3.hasMatch(trimmed) && re3.allMatches(trimmed).length == 2) {
      return DateTime.tryParse(trimmed.replaceAll('.', '-')) ?? DateTime.now();
    } else {
      return DateTime.now();
    }
  }

  String get dateWithF1 {
    try {
      final ds = split(' '),
          dd = ds.first.dateTime,
          td = ds[1].toTime(ds.last),
          trailingZeroHour = td.hour.toString().length == 1 ? '0' : '',
          trailingZeroMinute = td.minute.toString().length == 1 ? '0' : '';
      return '${fmd1.format(dd)}, ${dd.year} ($trailingZeroHour${td.hour}:$trailingZeroMinute${td.minute} Hrs)';
    } catch (e) {
      e.jot();
      return '';
    }
  }

  Color getColorFromHex([String? opacity]) {
    try {
      final String alpha = opacity?.toInt(null, 0).toRadixString(16) ?? 'ff',
          cst = trimmed.contains('#')
              ? trimmed.replaceAll('#', alpha)
              : '$alpha$trimmed';
      return cst.toInt(16, 0).color;
    } catch (e) {
      e.jot();
      return 0x00000000.color;
    }
  }

  TimeOfDay toTime([String? meridiem]) {
    if (trimmed.isNotEmpty &&
        r':'.getRE().hasMatch(trimmed) &&
        <int>[1, 2].contains(':'.allMatches(trimmed).length)) {
      final bool hasMatch = r'\s+\b|\b\s|\s|\b'.getRE().hasMatch(trimmed);
      if (!hasMatch) {
        final List<String> a = trimmed.split(':');
        final int hr = a.first.toInt(null, 0) +
            (meridiem?.lowerCased.trimmed == 'pm' ? 12 : 0);
        return TimeOfDay(hour: hr, minute: a[1].toInt(null, 0));
      } else if (hasMatch && r'[a-zA-Z]'.getRE().hasMatch(trimmed)) {
        final List<String> a = trimmed.split(' ');
        final List<String> a1 = a.first.split(':');
        final int hr = a1.first.toInt(null, 0) +
            (a.last.trimmed.lowerCased == 'pm' ? 12 : 0);
        return TimeOfDay(hour: hr, minute: a1[1].toInt(null, 0));
      } else if (hasMatch && !DateTime.now().isAtSameMomentAs(dateTime)) {
        return TimeOfDay.fromDateTime(dateTime);
      } else {
        return TimeOfDay.now();
      }
    } else {
      return TimeOfDay.now();
    }
  }

  TextStyle getStyleFromFont(
          {Color? color,
          double? height,
          Locale? locale,
          double? fontSize,
          Paint? foreground,
          Paint? background,
          double? wordSpacing,
          TextStyle? textStyle,
          FontStyle? fontStyle,
          double? letterSpacing,
          List<Shadow>? shadows,
          FontWeight? fontWeight,
          Color? decorationColor,
          Color? backgroundColor,
          TextBaseline? textBaseline,
          TextDecoration? decoration,
          double? decorationThickness,
          List<FontFeature>? fontFeatures,
          TextDecorationStyle? decorationStyle}) =>
      GoogleFonts.getFont(trimmed.firstLetterCapitalized,
          color: color,
          height: height,
          locale: locale,
          shadows: shadows,
          fontSize: fontSize,
          textStyle: textStyle,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          foreground: foreground,
          decoration: decoration,
          background: background,
          wordSpacing: wordSpacing,
          fontFeatures: fontFeatures,
          textBaseline: textBaseline,
          letterSpacing: letterSpacing,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          backgroundColor: backgroundColor,
          decorationThickness: decorationThickness);
}

extension Helper<T extends BuildContext> on T {
  OverlayState? get ol => Overlay.of(this);

  ThemeData get themeMaterial => Theme.of(this);

  Size get nonNullSize => MediaQuery.sizeOf(this);

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  EdgeInsets get insets => MediaQuery.viewInsetsOf(this);

  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  CupertinoThemeData get appleTheme => CupertinoTheme.of(this);

  ModalRoute<Object?>? get route => ModalRoute.of<Object?>(this);

  ScaffoldState get sct => Scaffold.maybeOf(this) ?? Scaffold.of(this);

  NavigatorState get nav => Navigator.maybeOf(this) ?? Navigator.of(this);

  MediaQueryData get dimensions =>
      MediaQuery.maybeOf(this) ?? MediaQuery.of(this);

  AnimatedListState get als =>
      AnimatedList.maybeOf(this) ?? AnimatedList.of(this);

  ScaffoldMessengerState get smcT =>
      ScaffoldMessenger.maybeOf(this) ?? ScaffoldMessenger.of(this);

  SliverAnimatedListState get slas =>
      SliverAnimatedList.maybeOf(this) ?? SliverAnimatedList.of(this);

  TextTheme get textTheme => themeMaterial.textTheme;

  double get aspectRatio => nonNullSize.aspectRatio;

  double get pixelRatio => dimensions.devicePixelRatio;

  Brightness get brightness => dimensions.platformBrightness;

  double get width => (dimensions.size.width + nonNullSize.width) / 2;

  double get height => (dimensions.size.height + nonNullSize.height) / 2;

  double get radius => (dimensions.size.radius + nonNullSize.radius) / 2;

  void hideSnackBar([SnackBarClosedReason? reason]) {
    smcT.hideCurrentSnackBar(reason: reason ?? SnackBarClosedReason.hide);
  }

  void goBack([dynamic result]) {
    try {
      Navigator.pop(this, result);
    } catch (e) {
      e.jot();
      navKey.currentState?.pop(result);
    }
  }

  void goBackForeverTo(String routeName) {
    try {
      Navigator.popUntil(this, routeName.popDestination);
    } catch (e) {
      e.jot();
      navKey.currentState?.popUntil(routeName.popDestination);
    }
  }

  void gotoFirstRoute() {
    try {
      Navigator.popUntil(this, isFirstRoute);
    } catch (e) {
      e.jot();
      navKey.currentState?.popUntil(isFirstRoute);
    }
  }

  void openDrawerIfAny() {
    sct.hasDrawer && !sct.isDrawerOpen ? sct.openDrawer() : doNothing();
  }

  void openEndDrawerIfAny() {
    sct.hasEndDrawer && !sct.isEndDrawerOpen
        ? sct.openEndDrawer()
        : doNothing();
  }

  void closeDrawerIfAnyOpen() {
    sct.hasDrawer && sct.isDrawerOpen ? sct.closeDrawer() : doNothing();
  }

  void closeEndIfAnyOpen() {
    sct.hasEndDrawer && sct.isEndDrawerOpen
        ? sct.closeEndDrawer()
        : doNothing();
  }

  void initScreenUtil(
          {Size? designSize,
          bool? minTextAdapt,
          bool? splitScreenMode,
          double Function(num, ScreenUtil)? fontSizeResolver}) =>
      ScreenUtil.init(this,
          fontSizeResolver: fontSizeResolver,
          minTextAdapt: minTextAdapt ?? false,
          splitScreenMode: splitScreenMode ?? false,
          designSize: designSize ?? ScreenUtil.defaultSize);

  U? getWidget<U extends Widget>() => findAncestorWidgetOfExactType<U>();

  U? getState<U extends State<V>, V extends StatefulWidget>() =>
      findAncestorStateOfType<U>();

  U getBlocProvider<U extends StateStreamableSource<Object?>>([bool? listen]) =>
      BlocProvider.of<U>(this, listen: listen ?? false);

  TabBloc getTabBloc([bool? listen]) => getBlocProvider<TabBloc>(listen);

  IconBloc getIconBloc([bool? listen]) => getBlocProvider<IconBloc>(listen);

  StockBloc getStockBloc([bool? listen]) => getBlocProvider<StockBloc>(listen);

  Future<U?> goTo<U extends Object?>(String routeName, {dynamic args}) async {
    U? val;
    try {
      return route?.settings.name != routeName
          ? Navigator.pushNamed<U>(this, routeName, arguments: args)
          : Future.value(val);
    } catch (e) {
      e.jot();
      return route?.settings.name != routeName
          ? navKey.currentState?.pushNamed<U>(routeName, arguments: args)
          : Future.value(val);
    }
  }

  Future<U?> gotoOnce<U extends Object?, V extends Object?>(String routeName,
      {V? res, dynamic args}) async {
    U? val;
    try {
      return route?.settings.name != routeName
          ? Navigator.pushReplacementNamed<U, V>(this, routeName,
              result: res, arguments: args)
          : Future.value(val);
    } catch (e) {
      e.jot();
      return route?.settings.name != routeName
          ? navKey.currentState?.pushReplacementNamed<U, V>(routeName,
              result: res, arguments: args)
          : Future.value(val);
    }
  }

  Future<U?> gotoForever<U extends Object?>(String routeName,
      {dynamic args}) async {
    U? val;
    try {
      return route?.settings.name != routeName
          ? Navigator.pushNamedAndRemoveUntil<U>(this, routeName, predicate,
              arguments: args)
          : Future.value(val);
    } catch (e) {
      e.jot();
      return route?.settings.name != routeName
          ? navKey.currentState?.pushNamedAndRemoveUntil<U>(
              routeName, predicate,
              arguments: args)
          : Future.value(val);
    }
  }

  Future<DateTime?> showAllDatePicker(
      {Locale? locale,
      String? helpText,
      bool? use24hFormat,
      DateTime? lastDate,
      String? cancelText,
      ImageFilter? filter,
      String? confirmText,
      DateTime? firstDate,
      Color? barrierColor,
      Offset? anchorPoint,
      String? barrierLabel,
      DateTime? initialDate,
      DateTime? currentDate,
      String? fieldHintText,
      String? fieldLabelText,
      bool? useRootNavigator,
      Color? backgroundColor,
      String? errorFormatText,
      String? errorInvalidText,
      bool? barrierDismissible,
      TextInputType? keyboardType,
      RouteSettings? routeSettings,
      TextDirection? textDirection,
      CupertinoDatePickerMode? mode,
      DatePickerDateOrder? dateOrder,
      Icon? switchToInputEntryModeIcon,
      Icon? switchToCalendarEntryModeIcon,
      DatePickerMode? initialDatePickerMode,
      DatePickerEntryMode? initialEntryMode,
      bool Function(DateTime)? selectableDayPredicate,
      Widget Function(BuildContext, Widget?)? builder,
      void Function(DatePickerEntryMode)? onDatePickerModeChange}) async {
    assert(isCupertino ||
        ((firstDate != null || initialDate != null) &&
            (lastDate != null || currentDate != null)));
    Widget appleDatePicker(BuildContext context) {
      DateTime? picked;
      void changeDate(DateTime dt) {
        picked = dt;
      }

      return CupertinoActionSheet(
          title: const Text('Choose Date'),
          cancelButton: CustomButton(
              onPressed: () {
                goBack(picked);
              },
              child: const Icon(Icons.close_outlined)),
          message: <double>[width / 1.28, height / 1.6].size.constrainChild(
              child: changeDate.getAppleDatePicker(
                  mode: mode,
                  dateOrder: dateOrder,
                  maximumDate: lastDate,
                  minimumDate: firstDate,
                  use24hFormat: use24hFormat,
                  initialDateTime: initialDate,
                  backgroundColor: backgroundColor)));
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return await showCupertinoModalPopup<DateTime>(
          context: this,
          filter: filter,
          builder: appleDatePicker,
          anchorPoint: anchorPoint,
          useRootNavigator: useRootNavigator ?? true,
          barrierDismissible: barrierDismissible ?? true,
          routeSettings: routeSettings ?? route?.settings,
          barrierColor: barrierColor ?? kCupertinoModalBarrierColor,
        );
      default:
        return await showDatePicker(
            context: this,
            builder: builder,
            cancelText: cancelText,
            confirmText: confirmText,
            initialDate: initialDate,
            currentDate: currentDate,
            anchorPoint: anchorPoint,
            barrierColor: barrierColor,
            barrierLabel: barrierLabel,
            textDirection: textDirection,
            useRootNavigator: useRootNavigator ?? true,
            lastDate: lastDate ?? (currentDate ?? today),
            firstDate: firstDate ?? (initialDate ?? today),
            selectableDayPredicate: selectableDayPredicate,
            barrierDismissible: barrierDismissible ?? true,
            onDatePickerModeChange: onDatePickerModeChange,
            routeSettings: routeSettings ?? route?.settings,
            switchToCalendarEntryModeIcon: switchToCalendarEntryModeIcon,
            initialDatePickerMode: initialDatePickerMode ?? DatePickerMode.day,
            initialEntryMode: initialEntryMode ?? DatePickerEntryMode.calendar);
    }
  }

  Future<bool?> appearDialogBox(
      {Widget? title,
      Widget? child,
      Widget? content,
      bool? dismissive,
      String? barrierLabel,
      List<Widget>? actions,
      TextStyle? titleStyle,
      Curve? insetAnimation,
      TextStyle? actionStyle,
      Duration? insetDuration,
      EdgeInsets? titlePadding,
      EdgeInsets? actionPadding,
      EdgeInsets? buttonPadding,
      EdgeInsets? contentPadding,
      RouteSettings? routeSettings,
      ScrollController? scrollController,
      MainAxisAlignment? actionsAlignment,
      ScrollController? actionScrollController}) {
    return showDialogBox<bool>(
        title: title,
        child: child,
        content: content,
        actions: actions,
        dismissive: dismissive,
        titleStyle: titleStyle,
        actionStyle: actionStyle,
        titlePadding: titlePadding,
        barrierLabel: barrierLabel,
        buttonPadding: buttonPadding,
        actionPadding: actionPadding,
        insetDuration: insetDuration,
        routeSettings: routeSettings,
        insetAnimation: insetAnimation,
        contentPadding: contentPadding,
        scrollController: scrollController,
        actionsAlignment: actionsAlignment,
        actionScrollController: actionScrollController);
  }

  Future<bool> revealDialogBox(List<String> options, List<VoidCallback> actions,
      {String? title,
      String? action,
      bool? dismissive,
      Curve? insetAnimation,
      TextStyle? titleStyle,
      TextStyle? actionStyle,
      TextStyle? optionStyle,
      required ButtonType bt,
      Duration? insetDuration,
      EdgeInsets? titlePadding,
      EdgeInsets? actionPadding,
      EdgeInsets? buttonPadding,
      ScrollController? scrollController,
      ScrollController? actionScrollController}) async {
    Widget optionsMap(String e) {
      final Text child = Text(e, style: optionStyle);
      final VoidCallback onTap = actions[options.indexOf(e)];
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return CupertinoDialogAction(
              onPressed: onTap, textStyle: actionStyle, child: child);
        default:
          return CustomButton(onPressed: onTap, type: bt, child: child);
      }
    }

    return options.length == actions.length &&
            options.isNotEmpty &&
            actions.isNotEmpty
        ? ((await appearDialogBox(
                dismissive: dismissive,
                titleStyle: titleStyle,
                actionStyle: actionStyle,
                titlePadding: titlePadding,
                buttonPadding: buttonPadding,
                actionPadding: actionPadding,
                insetDuration: insetDuration,
                insetAnimation: insetAnimation,
                scrollController: scrollController,
                actionScrollController: actionScrollController,
                actions: options.map<Widget>(optionsMap).toList(),
                title: title == null ? null : Text(title),
                content: action == null ? null : Text(action))) ??
            false)
        : options.length == actions.length &&
            options.isNotEmpty &&
            actions.isNotEmpty;
  }

  Future<bool> showSimpleYesNo(
      {bool? flag,
      bool? reverse,
      String? title,
      String? action,
      bool? dismissive,
      Curve? insetAnimation,
      TextStyle? titleStyle,
      TextStyle? actionStyle,
      TextStyle? optionStyle,
      required ButtonType bt,
      Duration? insetDuration,
      EdgeInsets? titlePadding,
      EdgeInsets? actionPadding,
      EdgeInsets? buttonPadding,
      ScrollController? scrollController,
      ScrollController? actionScrollController}) {
    VoidCallback mapAction(String action) {
      return () {
        goBack(action.toFlag);
      };
    }

    final List<String> options = <String>[
      (flag ?? true) ? 'Yes' : 'Ok',
      (flag ?? true) ? 'No' : 'Cancel'
    ];
    final List<VoidCallback> actions =
        ((reverse ?? false) ? options.reversed : options)
            .map<VoidCallback>(mapAction)
            .toList();
    return revealDialogBox(options, actions,
        bt: bt,
        title: title,
        action: action,
        dismissive: dismissive,
        titleStyle: titleStyle,
        actionStyle: actionStyle,
        optionStyle: optionStyle,
        titlePadding: titlePadding,
        insetDuration: insetDuration,
        buttonPadding: buttonPadding,
        actionPadding: actionPadding,
        insetAnimation: insetAnimation,
        scrollController: scrollController,
        actionScrollController: actionScrollController);
  }

  Future<bool> showSimplePopup(String option, VoidCallback onActionDone,
      {required ButtonType bt,
      String? action,
      String? title,
      bool? dismissive,
      Curve? insetAnimation,
      TextStyle? titleStyle,
      TextStyle? actionStyle,
      TextStyle? optionStyle,
      Duration? insetDuration,
      EdgeInsets? titlePadding,
      EdgeInsets? actionPadding,
      EdgeInsets? buttonPadding,
      ScrollController? scrollController,
      ScrollController? actionScrollController}) {
    return revealDialogBox(<String>[option], <VoidCallback>[onActionDone],
        bt: bt,
        title: title,
        action: action,
        dismissive: dismissive,
        titleStyle: titleStyle,
        actionStyle: actionStyle,
        optionStyle: optionStyle,
        titlePadding: titlePadding,
        buttonPadding: buttonPadding,
        actionPadding: actionPadding,
        insetDuration: insetDuration,
        insetAnimation: insetAnimation,
        scrollController: scrollController,
        actionScrollController: actionScrollController);
  }

  Future<U?> showDialogBox<U>(
      {Widget? child,
      Widget? title,
      Widget? content,
      bool? dismissive,
      String? barrierLabel,
      List<Widget>? actions,
      TextStyle? titleStyle,
      Curve? insetAnimation,
      TextStyle? actionStyle,
      Duration? insetDuration,
      EdgeInsets? titlePadding,
      EdgeInsets? actionPadding,
      EdgeInsets? buttonPadding,
      EdgeInsets? contentPadding,
      RouteSettings? routeSettings,
      ScrollController? scrollController,
      MainAxisAlignment? actionsAlignment,
      ScrollController? actionScrollController}) {
    Widget dialogBuilder(BuildContext context) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return CupertinoAlertDialog(
              title: title,
              content: content,
              actions: actions ?? <Widget>[],
              scrollController: scrollController,
              actionScrollController: actionScrollController,
              insetAnimationCurve: insetAnimation ?? Curves.decelerate,
              insetAnimationDuration:
                  insetDuration ?? const Duration(milliseconds: 100));
        default:
          return child ??
              AlertDialog(
                  title: title,
                  content: content,
                  actions: actions,
                  titlePadding: titlePadding,
                  titleTextStyle: titleStyle,
                  buttonPadding: buttonPadding,
                  contentTextStyle: actionStyle,
                  actionsPadding: actionPadding,
                  contentPadding: contentPadding,
                  actionsAlignment: actionsAlignment);
      }
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return showCupertinoDialog<U>(
            context: this,
            builder: dialogBuilder,
            barrierLabel: barrierLabel,
            barrierDismissible: dismissive ?? false,
            routeSettings: routeSettings ?? route?.settings);
      default:
        return showDialog<U>(
            context: this,
            builder: dialogBuilder,
            barrierLabel: barrierLabel,
            barrierDismissible: dismissive ?? false,
            routeSettings: routeSettings ?? route?.settings);
    }
  }

  Future<U?> showBottomPopup<U>(
      {Widget? child,
      Widget? title,
      Widget? message,
      double? elevation,
      ShapeBorder? shape,
      Clip? clipBehavior,
      Color? barrierColor,
      ImageFilter? filter,
      Offset? anchorPoint,
      Widget? cancelButton,
      List<Widget>? actions,
      Color? backgroundColor,
      bool? semanticsDismissible,
      BoxConstraints? constraints,
      RouteSettings? routeSettings,
      ScrollController? actionScrollController,
      ScrollController? messageScrollController,
      AnimationController? transitionAnimationController}) {
    Widget bottomPopupBuilder(BuildContext context) {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return CupertinoActionSheet(
              title: title,
              message: message,
              actions: actions,
              cancelButton: cancelButton,
              actionScrollController: actionScrollController,
              messageScrollController: messageScrollController);
        default:
          return child ?? const EmptyWidget();
      }
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return showCupertinoModalPopup<U>(
            context: this,
            filter: filter,
            anchorPoint: anchorPoint,
            builder: bottomPopupBuilder,
            routeSettings: routeSettings ?? route?.settings,
            semanticsDismissible: semanticsDismissible ?? false);
      default:
        return showModalBottomSheet<U>(
            shape: shape,
            context: this,
            elevation: elevation,
            anchorPoint: anchorPoint,
            constraints: constraints,
            barrierColor: barrierColor,
            clipBehavior: clipBehavior,
            builder: bottomPopupBuilder,
            backgroundColor: backgroundColor,
            routeSettings: routeSettings ?? route?.settings,
            transitionAnimationController: transitionAnimationController);
    }
  }

  Future<U?> manifestDialogBox<U>(
      List<String> options, List<VoidCallback> actions, ButtonType type,
      {String? title,
      String? action,
      bool? dismissive,
      Curve? insetAnimation,
      TextStyle? titleStyle,
      TextStyle? actionStyle,
      TextStyle? optionStyle,
      Duration? insetDuration,
      EdgeInsets? titlePadding,
      EdgeInsets? actionPadding,
      EdgeInsets? buttonPadding,
      ScrollController? scrollController,
      ScrollController? actionScrollController}) async {
    Widget optionsMap(String e) {
      final Text child = Text(e, style: optionStyle);
      final VoidCallback onTap = actions[options.indexOf(e)];
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return CupertinoDialogAction(
              onPressed: onTap, textStyle: actionStyle, child: child);
        default:
          return CustomButton(type: type, onPressed: onTap, child: child);
      }
    }

    return options.length == actions.length &&
            options.isNotEmpty &&
            actions.isNotEmpty
        ? await showDialogBox<U>(
            dismissive: dismissive,
            titleStyle: titleStyle,
            actionStyle: actionStyle,
            titlePadding: titlePadding,
            buttonPadding: buttonPadding,
            actionPadding: actionPadding,
            insetDuration: insetDuration,
            insetAnimation: insetAnimation,
            scrollController: scrollController,
            title: title == null ? null : Text(title),
            content: action == null ? null : Text(action),
            actionScrollController: actionScrollController,
            actions: options.map<Widget>(optionsMap).toList())
        : null;
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> revealSnackBar(
          {double? width,
          Widget? content,
          double? elevation,
          ShapeBorder? shape,
          Duration? duration,
          Clip? clipBehaviour,
          Color? backgroundColor,
          SnackBarAction? action,
          VoidCallback? onVisible,
          SnackBarBehavior? behavior,
          EdgeInsetsGeometry? margin,
          EdgeInsetsGeometry? padding,
          Animation<double>? animation,
          DismissDirection? direction}) =>
      smcT.showSnackBar(SnackBar(
          shape: shape,
          width: width,
          action: action,
          margin: margin,
          padding: padding,
          behavior: behavior,
          elevation: elevation,
          animation: animation,
          onVisible: onVisible,
          backgroundColor: backgroundColor,
          content: content ?? const EmptyWidget(),
          clipBehavior: clipBehaviour ?? Clip.hardEdge,
          dismissDirection: direction ?? DismissDirection.down,
          duration: duration ?? const Duration(milliseconds: 4000)));
}
