import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:june/june.dart';

import '../extensions/extensions.dart';
import '../models/common/account_history_record.dart';
import '../states/common_state.dart';
import '../views/widgets/common/circular_loader.dart';
import 'enums.dart';

void rollbackOrientations() {
  DeviceOrientation.values.setAllowedOrientations();
}

void lockScreenRotation() {
  <DeviceOrientation>[
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
  ].setAllowedOrientations();
}

void showStatusBar() {
  SystemUiMode.manual.setSystemUIMode([SystemUiOverlay.top]);
}

void hideLoader({Duration? time, LoaderType? type}) {
  void removeLoader() {
    try {
      overlayLoader(time: time, type: type).remove();
    } catch (e) {
      e.jot();
    }
  }

  time?.getTimer(removeLoader).cancel();
}

void doNothing() {}

Widget appleDefaultContextBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return CupertinoAdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState);
}

Widget materialDefaultContextBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState);
}

OverlayEntry overlayLoader({Duration? time, LoaderType? type}) {
  Widget loaderBuilder(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        width: context.width,
        height: context.height,
        child: Material(
            color: context.themeMaterial.primaryColor.withOpacity(0.5),
            child: CircularLoader(
                duration: time,
                loaderType: type,
                color: context.themeMaterial.primaryColor)));
  }

  return OverlayEntry(builder: loaderBuilder);
}

String emptyString() => '';

CommonState obtainCommonState() => CommonState();

bool onBadCertificate(X509Certificate cert, String host, int port) {
  return cert.isValid;
}

bool isImagePath(String str) {
  str.jot();
  return str.isImagePath;
}

T getState<T extends JuneState>(T Function() dependency,
        {String? tag, bool? permanent}) =>
    June.getState<T>(dependency, tag: tag, permanent: permanent ?? true);

bool predicate(Route<dynamic> route) {
  route.jot();
  return false;
}

Icon obtainStar(int index) {
  return index.filledStar;
}

Icon obtainStarOutline(int index) {
  return index.outlinedStar;
}

bool isFirstRoute(Route route) {
  route.jot();
  return route.isFirst;
}

bool isActiveRoute(Route route) {
  route.jot();
  return route.isActive;
}

bool isCurrentRoute(Route route) {
  route.jot();
  return route.isCurrent;
}

bool predicate4(Route route) {
  route.jot();
  return route.hasActiveRouteBelow;
}

bool predicate5(Route route) {
  route.jot();
  return route.willHandlePopInternally;
}

String getData(List<int> values) {
  return base64.encode(values);
}

double getDoubleData(Map<String, dynamic> data) {
  return (data['data'] as double);
}

bool getBoolData(Map<String, dynamic> data) {
  return (data['data'] as bool);
}

DateTime groupAccountHistoryBy(AccountHistoryRecord record) {
  // record.date.jot();
  return record.date;
}

Uint8List fromIntList(List<int> list) {
  return getData(list).listData;
}

Widget numberBuilder(CommonState cm) {
  return Center(child: cm.ct.string.textWidget());
}

Widget getImageLoader(BuildContext context, Widget child, int? i, bool flag) {
  i.jot();
  flag.jot();
  return child;
}

Widget getErrorWidget(BuildContext context, Object object, StackTrace? trace) {
  object.jot();
  trace.jot();
  return object.string.textWidget();
}

String toName(String str) => str.firstLetterCapitalized;

String? validateName(String? name) =>
    (name?.isEmpty ?? true) ? 'Enter a valid Name' : null;

String? validatePassword(String? password) {
  return password != null && password.isValidPassword
      ? null
      : 'Please enter valid password';
}

String? validateEmail(String? email) {
  return email != null && email.isValidEmail
      ? null
      : 'Please enter a valid Email';
}
