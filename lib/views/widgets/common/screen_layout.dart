import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'empty_widget.dart';

class ScreenLayout extends StatelessWidget {
  final String? restorationId;
  final PreferredSizeWidget? appBar;
  final double? drawerEdgeDragWidth;
  final List<Widget>? persistentFooterButtons;
  final Color? backgroundColor, drawerScrimColor;
  final DragStartBehavior? drawerDragStartBehavior;
  final ObstructingPreferredSizeWidget? navigationBar;
  final AlignmentDirectional? persistentFooterAlignment;
  final void Function(bool)? onDrawerChanged, onEndDrawerChanged;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final Widget? drawer,
      content,
      endDrawer,
      bottomSheet,
      bottomNavigationBar,
      floatingActionButton;
  final bool? primary,
      extendBody,
      isTabScreen,
      extendBodyBehindAppBar,
      resizeToAvoidBottomInset,
      drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture;
  const ScreenLayout(
      {super.key,
      this.appBar,
      this.drawer,
      this.content,
      this.primary,
      this.endDrawer,
      this.extendBody,
      this.isTabScreen,
      this.bottomSheet,
      this.navigationBar,
      this.restorationId,
      this.onDrawerChanged,
      this.backgroundColor,
      this.drawerScrimColor,
      this.onEndDrawerChanged,
      this.drawerEdgeDragWidth,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.extendBodyBehindAppBar,
      this.persistentFooterButtons,
      this.drawerDragStartBehavior,
      this.resizeToAvoidBottomInset,
      this.persistentFooterAlignment,
      this.drawerEnableOpenDragGesture,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.endDrawerEnableOpenDragGesture});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        // final itt = isTabScreen ?? false;
        return
            // itt ? CupertinoTabScaffold(tabBar: tabBar, tabBuilder: tabBuilder) :
            CupertinoPageScaffold(
                navigationBar: navigationBar,
                backgroundColor: backgroundColor,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
                child: content ?? const EmptyWidget());
      default:
        return Scaffold(
            body: content,
            appBar: appBar,
            drawer: drawer,
            endDrawer: endDrawer,
            bottomSheet: bottomSheet,
            primary: primary ?? true,
            restorationId: restorationId,
            extendBody: extendBody ?? false,
            backgroundColor: backgroundColor,
            onDrawerChanged: onDrawerChanged,
            drawerScrimColor: drawerScrimColor,
            onEndDrawerChanged: onEndDrawerChanged,
            drawerEdgeDragWidth: drawerEdgeDragWidth,
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
            persistentFooterButtons: persistentFooterButtons,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
            floatingActionButtonAnimator: floatingActionButtonAnimator,
            floatingActionButtonLocation: floatingActionButtonLocation,
            drawerEnableOpenDragGesture: drawerEnableOpenDragGesture ?? true,
            endDrawerEnableOpenDragGesture:
                endDrawerEnableOpenDragGesture ?? true,
            drawerDragStartBehavior:
                drawerDragStartBehavior ?? DragStartBehavior.start,
            persistentFooterAlignment:
                persistentFooterAlignment ?? AlignmentDirectional.centerEnd);
    }
  }
}
