import 'icon_state.dart';

class MoreState extends IconState {
  static final MoreState _singleton = MoreState._internal();

  factory MoreState() => _singleton;

  MoreState._internal();
}
