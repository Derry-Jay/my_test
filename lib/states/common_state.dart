import 'dart:async';

import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:my_test/extensions/continuations.dart';

import '../extensions/extensions.dart';
import '../models/common/account_history_record.dart';
import '../models/common/progress.dart';
import '../utils/keys.dart';
import '../utils/methods.dart';
import '../utils/values.dart';
import '../views/widgets/common/empty_widget.dart';

class CommonState extends JuneState with AnimationLocalStatusListenersMixin {
  CommonState._internal();

  static final CommonState _singleton = CommonState._internal();

  factory CommonState() => _singleton;

  int itemCount = 5, ct = 0;

  Animation<double>? animation;

  AnimationController? animationController;

  Stream<Progress> get progress => _progressCon.stream;

  final _progressCon = StreamController<Progress>.broadcast();

  final accountRecordHistory = <AccountHistoryRecord>[
    AccountHistoryRecord(today, 'Segments Change', 'In Progress', 'Segments'),
    AccountHistoryRecord(today, 'Segments Change', 'In Progress', 'Segments'),
    AccountHistoryRecord(yesterday, 'Segments Change', 'Completed', 'Segments'),
    AccountHistoryRecord(yesterday, 'Segments Change', 'Completed', 'Segments'),
    AccountHistoryRecord(today, 'Segments Change', 'In Progress', 'Segments'),
    AccountHistoryRecord(yesterday, 'Segments Change', 'Completed', 'Segments'),
    AccountHistoryRecord(
        2024.getDate(month: 10, day: 20), 'Income Range', 'Completed', 'KYC'),
    AccountHistoryRecord(
        2024.getDate(month: 10, day: 20), 'Email', 'In Progress', 'KYC'),
    AccountHistoryRecord(
        2024.getDate(month: 10, day: 20), 'Mobile', 'In Progress', 'KYC'),
    AccountHistoryRecord(2024.getDate(month: 10, day: 13), 'Segments Change',
        'Completed', 'Segments'),
    AccountHistoryRecord(2024.getDate(month: 10, day: 13), 'Segments Change',
        'Completed', 'Segments'),
    AccountHistoryRecord(2024.getDate(month: 10, day: 10), 'Segments Change',
        'Completed', 'Segments')
  ];

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

  Widget getRecordItem(BuildContext ct1, int i) {
    final element = accountRecordHistory[i];
    return Card.filled(
        child: element.request
            .textWidget(
                style: 'manrope'
                    .getStyleFromFont(height: 1.25, color: 0xFF436AF5.color))
            // .
            // // filterC
            // chip(
            //     // selected: true,
            //     color: 0xFFECF0FE.color,
            //     // selectedColor: 0xFF436AF5.color,
            //     deleteIconColor: 0xFF436AF5.color,
            //     shape: BorderSide(color: 0xFF436AF5.color).stadiumBorder,
            //     deleteIcon: assets.tick
            //         .getImageFromAssetOrNetwork(fit: BoxFit.fitHeight),
            //     onDeleted: () {},
            //     labelStyle:
            //         'manrope'.getStyleFromFont(color: 0xFF436AF5.color))
                    );
  }

  Widget listItemSeparator(BuildContext ct1, int i) {
    final cur = accountRecordHistory[i];
    if (i < 1) {
      return cur.date.formattedDate1.textWidget();
    } else if (i >= accountRecordHistory.length) {
      return const EmptyWidget();
    } else {
      final prev = accountRecordHistory[i - 1],
          nxt = accountRecordHistory[i + 1];
      return prev.date.compareDateOnly(cur.date) ||
              cur.date.compareDateOnly(nxt.date)
          ? const EmptyWidget()
          : cur.date.formattedDate1.textWidget();
    }
  }

  FutureOr firstScreen() {
    return bc?.gotoForever('/any');
  }
}
