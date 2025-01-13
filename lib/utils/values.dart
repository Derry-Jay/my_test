import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:local_auth_android/src/auth_messages_android.dart';
import 'package:local_auth_darwin/types/auth_messages_ios.dart';
import 'package:local_auth_platform_interface/types/auth_messages.dart';
import 'package:local_auth_windows/types/auth_messages_windows.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/icon_bloc.dart';
import '../blocs/stock_bloc.dart';
import '../blocs/tab_bloc.dart';
import '../css/css.dart';
import '../css/measurements.dart';
import '../css/shades.dart';
import '../extensions/extensions.dart';
import '../models/common/app_config.dart';
import '../models/common/progress.dart';
import 'enums.dart';
import 'methods.dart';
import 'my_geo_locator.dart';
import 'my_geocoder.dart';
import 'my_local_authentication.dart';
import 'my_media_picker.dart';
import 'my_polyline_points.dart';
import 'route_generator.dart';

int page = 0;

WidgetsBinding? wb;

bool hideText = true;

GlobalConfiguration? gc;

AppConfig acf = AppConfig();

DateTime? currentBackPressTime;

StreamSubscription<Progress>? ssc;

Map<String, dynamic> body = <String, dynamic>{};

const loaderDur1 = Duration(seconds: 2),
    authOptions = AuthenticationOptions(),
    loaderDur2 = Duration(seconds: 1, milliseconds: 200),
    loaderDur3 = Duration(seconds: 2, milliseconds: 400),
    loaderDur4 = Duration(seconds: 1, milliseconds: 800),
    apiMode =
        kDebugMode ? APIMode.dev : (kProfileMode ? APIMode.test : APIMode.prod),
    authMsgs = <AuthMessages>[
      IOSAuthMessages(),
      AndroidAuthMessages(),
      WindowsAuthMessages()
    ];

final css = Css(),
    st = Stopwatch(),
    shades = Shades(),
    gco = MyGeocoder(),
    gl = MyGeoLocator(),
    nf = NumberFormat(),
    mp = MyMediaPicker(),
    fmd1 = DateFormat.MMMd(),
    spaceExp = r'\s'.getRE(),
    mpp = MyPolylinePoints(),
    la = MyLocalAuthentication(),
    thisMoment = TimeOfDay.now(),
    sc = TextEditingController(),
    tc = TextEditingController(),
    isCupertino = isIOS || isMac,
    measurements = Measurements(),
    phc = TextEditingController(),
    pwc = TextEditingController(),
    sdc = TextEditingController(),
    edc = TextEditingController(),
    rg = RouteGenerator(flag: true),
    isPortable = isAndroid || isIOS,
    alphaNumExp = r'^[a-zA-Z0-9]+$'.getRE(),
    sharedPrefs = SharedPreferences.getInstance(),
    isIOS = Platform.isIOS && defaultTargetPlatform == TargetPlatform.iOS,
    minPwdLth = 'minimum_password_length'.valFromConfig<String>()?.toInt() ?? 8,
    today = DateTime.now()
        .year
        .getDate(month: DateTime.now().month, day: DateTime.now().day),
    yesterday = DateTime.now()
        .year
        .getDate(month: DateTime.now().month, day: DateTime.now().day)
        .subtract(Duration(days: 1)),
    isAndroid =
        Platform.isAndroid && defaultTargetPlatform == TargetPlatform.android,
    isWindows =
        Platform.isWindows && defaultTargetPlatform == TargetPlatform.windows,
    isFuchsia =
        Platform.isFuchsia && defaultTargetPlatform == TargetPlatform.fuchsia,
    maxPwdLth =
        'maximum_password_length'.valFromConfig<String>()?.toInt() ?? 16,
    isMac = Platform.isMacOS && defaultTargetPlatform == TargetPlatform.macOS,
    isLinux = Platform.isLinux && defaultTargetPlatform == TargetPlatform.linux,
    splashScreenDelay =
        'splash_screen_delay'.valFromConfig<String>()?.toInt() ?? 3,
    isWeb = kIsWeb &&
        !(isAndroid || isCupertino || isWindows || isLinux || isFuchsia),
    pwdExp =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$'.getRE(),
    mailExp =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"
            .getRE(),
    minDesignSize = <double>[
      'minimum_screen_width'.valFromConfig<String>()?.toDouble() ?? double.nan,
      'minimum_screen_height'.valFromConfig<String>()?.toDouble() ?? double.nan
    ].size,
    providers = <SingleChildWidget>[
      BlocProvider<TabBloc>(create: getTab),
      BlocProvider<IconBloc>(create: getIcon),
      BlocProvider<StockBloc>(create: getStock)
    ];
