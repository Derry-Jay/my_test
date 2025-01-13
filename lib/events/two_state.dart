import 'tab_state.dart';

class TwoState extends TabState {
  static final TwoState _singleton = TwoState._internal();

  factory TwoState() => _singleton;

  TwoState._internal();
}
