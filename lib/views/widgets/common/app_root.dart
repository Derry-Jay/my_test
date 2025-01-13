import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/extensions/continuations.dart';
import '../../../utils/values.dart';

class AppRoot extends StatelessWidget {
  final Widget? home;
  final Color? color;
  final Locale? locale;
  final ThemeMode? themeMode;
  final Curve? themeAnimationCurve;
  final ScrollBehavior? scrollBehavior;
  final CupertinoThemeData? themeApple;
  final Duration? themeAnimationDuration;
  final Map<Type, Action<Intent>>? actions;
  final Map<String, WidgetBuilder>? routes;
  final Iterable<Locale>? supportedLocales;
  final AnimationStyle? themeAnimationStyle;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final List<NavigatorObserver>? navigatorObservers;
  final String Function(BuildContext)? onGenerateTitle;
  final String? title, initialRoute, restorationScopeId;
  final Widget Function(BuildContext, Widget?)? builder;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final List<Route<dynamic>> Function(String)? onGenerateInitialRoutes;
  final bool Function(NavigationNotification)? onNavigationNotification;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
      localeListResolutionCallback;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
      onUnknownRoute;
  final ThemeData? themeMaterial,
      darkMaterial,
      highContrastMaterial,
      highContrastDarkMaterial;
  final bool? showSemanticsDebugger,
      showPerformanceOverlay,
      useInheritedMediaQuery,
      debugShowCheckedModeBanner,
      checkerboardOffscreenLayers,
      checkerboardRasterCacheImages;
  const AppRoot(
      {super.key,
      this.home,
      this.color,
      this.title,
      this.routes,
      this.locale,
      this.builder,
      this.actions,
      this.shortcuts,
      this.themeMode,
      this.themeApple,
      this.navigatorKey,
      this.initialRoute,
      this.darkMaterial,
      this.themeMaterial,
      this.onUnknownRoute,
      this.scrollBehavior,
      this.onGenerateRoute,
      this.onGenerateTitle,
      this.supportedLocales,
      this.restorationScopeId,
      this.navigatorObservers,
      this.themeAnimationStyle,
      this.themeAnimationCurve,
      this.highContrastMaterial,
      this.scaffoldMessengerKey,
      this.showSemanticsDebugger,
      this.localizationsDelegates,
      this.showPerformanceOverlay,
      this.themeAnimationDuration,
      this.useInheritedMediaQuery,
      this.onGenerateInitialRoutes,
      this.onNavigationNotification,
      this.highContrastDarkMaterial,
      this.localeResolutionCallback,
      this.debugShowCheckedModeBanner,
      this.checkerboardOffscreenLayers,
      this.localeListResolutionCallback,
      this.checkerboardRasterCacheImages});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoApp(
            home: home,
            color: color,
            locale: locale,
            actions: actions,
            builder: builder,
            theme: themeApple,
            shortcuts: shortcuts,
            initialRoute: initialRoute,
            navigatorKey: navigatorKey,
            title: title ?? acf.fullName,
            scrollBehavior: scrollBehavior,
            onUnknownRoute: onUnknownRoute,
            onGenerateRoute: onGenerateRoute,
            onGenerateTitle: onGenerateTitle,
            restorationScopeId: restorationScopeId,
            localizationsDelegates: localizationsDelegates,
            onGenerateInitialRoutes: onGenerateInitialRoutes,
            routes: routes ?? const <String, WidgetBuilder>{},
            localeResolutionCallback: localeResolutionCallback,
            onNavigationNotification: onNavigationNotification,
            showSemanticsDebugger: showSemanticsDebugger ?? false,
            showPerformanceOverlay: showPerformanceOverlay ?? false,
            localeListResolutionCallback: localeListResolutionCallback,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers ?? false,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner ?? kDebugMode,
            checkerboardRasterCacheImages:
                checkerboardRasterCacheImages ?? false,
            navigatorObservers:
                navigatorObservers ?? const <NavigatorObserver>[],
            supportedLocales:
                supportedLocales ?? const <Locale>[Locale('en', 'US')]);
      default:
        return MaterialApp(
            home: home,
            color: color,
            locale: locale,
            actions: actions,
            builder: builder,
            shortcuts: shortcuts,
            theme: themeMaterial,
            darkTheme: darkMaterial,
            initialRoute: initialRoute,
            navigatorKey: navigatorKey,
            title: title ?? acf.fullName,
            scrollBehavior: scrollBehavior,
            onUnknownRoute: onUnknownRoute,
            onGenerateRoute: onGenerateRoute,
            onGenerateTitle: onGenerateTitle,
            themeMode: themeMode ?? 'system'.tm,
            restorationScopeId: restorationScopeId,
            highContrastTheme: highContrastMaterial,
            themeAnimationStyle: themeAnimationStyle,
            scaffoldMessengerKey: scaffoldMessengerKey,
            localizationsDelegates: localizationsDelegates,
            highContrastDarkTheme: highContrastDarkMaterial,
            onGenerateInitialRoutes: onGenerateInitialRoutes,
            routes: routes ?? const <String, WidgetBuilder>{},
            localeResolutionCallback: localeResolutionCallback,
            onNavigationNotification: onNavigationNotification,
            showSemanticsDebugger: showSemanticsDebugger ?? false,
            showPerformanceOverlay: showPerformanceOverlay ?? false,
            themeAnimationCurve: themeAnimationCurve ?? Curves.linear,
            localeListResolutionCallback: localeListResolutionCallback,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers ?? false,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner ?? kDebugMode,
            checkerboardRasterCacheImages:
                checkerboardRasterCacheImages ?? false,
            themeAnimationDuration:
                themeAnimationDuration ?? kThemeAnimationDuration,
            navigatorObservers:
                navigatorObservers ?? const <NavigatorObserver>[],
            supportedLocales:
                supportedLocales ?? const <Locale>[Locale('en', 'US')]);
    }
  }
}
