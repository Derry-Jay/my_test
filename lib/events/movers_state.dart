import 'icon_state.dart';

class MoversState extends IconState {
  static final MoversState _singleton = MoversState._internal();

  factory MoversState() => _singleton;

  MoversState._internal();
}
