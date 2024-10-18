import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MyPolylinePoints extends PolylinePoints {
  static final MyPolylinePoints _singleton = MyPolylinePoints._internal();

  factory MyPolylinePoints() => _singleton;

  MyPolylinePoints._internal();
}
