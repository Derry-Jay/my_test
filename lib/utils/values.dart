import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth_android/src/auth_messages_android.dart';
import 'package:local_auth_darwin/types/auth_messages_ios.dart';
import 'package:local_auth_platform_interface/types/auth_messages.dart';
import 'package:local_auth_windows/types/auth_messages_windows.dart';

import '../css/css.dart';
import '../css/measurements.dart';
import '../css/shades.dart';
import '../extensions/extensions.dart';
import '../models/common/app_config.dart';
import '../models/common/progress.dart';
import '../states/common_state.dart';
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

const authOptions = AuthenticationOptions(),
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
    conn = Connectivity(),
    today = DateTime.now(),
    fmd1 = DateFormat.MMMd(),
    // dip = DeviceInfoPlugin(),
    spaceExp = r'\s'.getRE(),
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
    mpp = MyPolylinePoints(),
    alphaNumExp = r'^[a-zA-Z0-9]+$'.getRE(),
    cm = getState<CommonState>(obtainCommonState),
    sharedPrefs = SharedPreferences.getInstance(),
    isIOS = Platform.isIOS && defaultTargetPlatform == TargetPlatform.iOS,
    minPwdLth = 'minimum_password_length'.valFromConfig<String>()?.toInt() ?? 8,
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
    ].size;
