import 'dart:async';

import 'package:flutter/material.dart';
import 'package:june/june.dart';

import '../extensions/extensions.dart';
import '../models/common/progress.dart';
import '../utils/keys.dart';
import '../utils/methods.dart';
import '../utils/values.dart';

class CommonState extends JuneState with AnimationLocalStatusListenersMixin {
  static final CommonState _singleton = CommonState._internal();

  factory CommonState() => _singleton;

  CommonState._internal();

  bool? flag;

  int itemCount = 5, ct = 0;

  Animation<double>? animation;

  AnimationController? animationController;

  Stream<Progress> get progress => _progressCon.stream;

  final _progressCon = StreamController<Progress>.broadcast();

  BuildContext? get bc =>
      navKey.currentContext ?? wb?.buildOwner?.focusManager.rootScope.context;

  void setItemCount(int ct) {
    itemCount = ct;
  }

  void incrementCount() {
    ct += 1;
    setState();
  }

  void decrementCount() {
    ct -= 1;
    setState();
  }

  void nextScreen() {
    void gotoNextScreen(Duration timeStamp) async {
      await Future.delayed(
          timeStamp.inSeconds == splashScreenDelay
              ? timeStamp
              : Duration(seconds: splashScreenDelay),
          firstScreen);
    }

    wb?.addPostFrameCallback(gotoNextScreen);
  }

  void detectChange(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
      case AnimationStatus.dismissed:
        animationController?.dispose();
        break;
      default:
        doNothing();
        break;
    }
  }

  void goFrontIfMounted([double? from]) async {
    await animationController?.forward(from: from);
    // animationController?.notifyListeners();
    animationController?.notifyStatusListeners(AnimationStatus.forward);
  }

  void assignState(TickerProvider tp) {
    void setData(Duration duration) {
      animationController = AnimationController(duration: duration, vsync: tp);
      animation = Tween<double>(begin: bc?.pixelRatio, end: 0).animate(
          CurvedAnimation(parent: animationController!, curve: Curves.easeOut))
        ..addListener(goFrontIfMounted)
        ..addStatusListener(detectChange);
    }

    wb?.addPostFrameCallback(setData);
  }

  void loaderDispose() {
    animationController?.dispose();
  }

  @override
  void didRegisterListener() {
    // TODO: implement didRegisterListener
    'object'.jot();
  }

  @override
  void didUnregisterListener() {
    // TODO: implement didUnregisterListener
    'object2'.jot();
  }

  FutureOr firstScreen() {
    return bc?.gotoForever('/my');
  }
}
