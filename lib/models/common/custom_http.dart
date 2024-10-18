import 'dart:io';

import '../../utils/methods.dart';

class CustomHttp extends HttpOverrides {
  static final CustomHttp _singleton = CustomHttp._internal();

  factory CustomHttp() => _singleton;

  CustomHttp._internal();

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = onBadCertificate;
  }
}
