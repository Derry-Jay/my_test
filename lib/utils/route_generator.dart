import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/extensions/extensions.dart';
import '../models/common/route_argument.dart';
import '../views/screens/common/error_screen.dart';
import '../views/screens/common/menu_screen.dart';
import '../views/screens/common/my_screen.dart';
import '../views/screens/common/sample_screen.dart';
import 'enums.dart';

class RouteGenerator {
  late bool? _shouldPerformTransition;

  static final RouteGenerator _singleton = RouteGenerator._internal();

  factory RouteGenerator({bool? flag}) {
    _singleton._shouldPerformTransition = flag;
    return _singleton;
  }

  RouteGenerator._internal();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as RouteArgument?;

    Widget pageBuilder(BuildContext context) {
      switch (settings.name) {
        case '/my':
          return const MyScreen();
        case '/menu':
          return const MenuScreen();
        case '/sample':
          return const SampleScreen();
        default:
          return const ErrorScreen();
      }
    }

    Widget screenBuilder(
        BuildContext ct1, Animation<double> a1, Animation<double> a2) {
      Widget contentBuilder(BuildContext ct2, Widget? c3) {
        Widget portionBuilder(BuildContext ct3, Widget? c4) {
          return c4 ?? pageBuilder(ct3);
        }

        return AnimatedBuilder(
            animation: a2, builder: portionBuilder, child: c3);
      }

      return AnimatedBuilder(animation: a1, builder: contentBuilder);
    }

    Widget transitionBuilder(BuildContext ct4, Animation<double> a1,
        Animation<double> a2, Widget c1) {
      Widget transitionedPageBuilder(BuildContext ct5, Widget? c2) {
        Widget transitionedScreenBuilder(BuildContext ct6, Widget? c5) {
          try {
            switch (args?.type) {
              case TransitionType.slide:
                return SlideTransition(
                    position: a1.drive(Tween(
                        begin: [1.0, 1.0].offset, end: [0.0, 0.0].offset)),
                    child: c5);
              case TransitionType.scale:
                return ScaleTransition(scale: a1, child: c5);
              case TransitionType.fade:
                return FadeTransition(opacity: a1, child: c5);
              case TransitionType.rotate:
                return RotationTransition(turns: a2, child: c5);
              case TransitionType.size:
                return SizeTransition(sizeFactor: a1, child: c5);
              default:
                return pageBuilder(ct6);
            }
          } catch (e) {
            e.jot();
            return pageBuilder(ct6);
          }
        }

        return AnimatedBuilder(
            animation: a2, builder: transitionedScreenBuilder, child: c2);
      }

      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return CupertinoPageTransition(
              primaryRouteAnimation: a1,
              secondaryRouteAnimation: a2,
              linearTransition: _shouldPerformTransition ?? false,
              child: c1);
        default:
          switch (args?.type) {
            case null:
            case TransitionType.normal:
              return screenBuilder(ct4, a1, a2);
            default:
              return AnimatedBuilder(
                  animation: a1, builder: transitionedPageBuilder, child: c1);
          }
      }
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoPageRoute(builder: pageBuilder, settings: settings);
      default:
        return (_shouldPerformTransition ?? false)
            ? PageRouteBuilder(
                settings: settings,
                pageBuilder: screenBuilder,
                transitionsBuilder: transitionBuilder)
            : MaterialPageRoute(builder: pageBuilder, settings: settings);
    }
  }
}
