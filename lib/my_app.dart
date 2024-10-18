import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/extensions/extensions.dart';
import 'app_root.dart';
import 'utils/keys.dart';
import 'utils/values.dart';
import 'views/screens/common/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget rootBuilder(BuildContext context, Widget? child) {
    context.initScreenUtil(minTextAdapt: true, designSize: minDesignSize);
    return AppRoot(
        home: child,
        navigatorKey: navKey,
        themeMaterial: css.theme,
        themeApple: css.appleTheme,
        onGenerateRoute: rg.generateRoute,
        title: 'name'.valFromConfig<String>(),
        debugShowCheckedModeBanner: kDebugMode);
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      minTextAdapt: true,
      builder: rootBuilder,
      designSize: minDesignSize,
      child: const SplashScreen());
}
