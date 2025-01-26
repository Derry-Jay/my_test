import 'package:common_utils/common_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/values.dart';
// import '/extensions/extensions.dart';
import 'views/screens/common/my_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget rootBuilder(BuildContext context, Widget? child) {
    context.initScreenUtil(minTextAdapt: true, designSize: minDesignSize);
    return AppRoot(
        home: child,
        navigatorKey: navKey,
        themeMaterial: css.theme,
        themeApple: css.appleTheme,
        // onGenerateRoute: rg.generateRoute,
        debugShowCheckedModeBanner: kDebugMode);
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: providers,
      child: ScreenUtilInit(
          minTextAdapt: true,
          builder: rootBuilder,
          designSize: minDesignSize,
          child: const MyScreen()));
}
