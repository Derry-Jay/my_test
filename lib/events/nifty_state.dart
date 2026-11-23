import 'tab_state.dart';

class NiftyState extends TabState {
  static final NiftyState _singleton = NiftyState._internal();

  factory NiftyState() => _singleton;

  NiftyState._internal();
}
