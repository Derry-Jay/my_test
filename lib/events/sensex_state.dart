import 'tab_state.dart';

class SensexState extends TabState {
  static final SensexState _singleton = SensexState._internal();

  factory SensexState() => _singleton;

  SensexState._internal();
}
