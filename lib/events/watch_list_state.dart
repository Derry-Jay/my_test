import 'icon_state.dart';

class WatchListState extends IconState {
  static final WatchListState _singleton = WatchListState._internal();

  factory WatchListState() => _singleton;

  WatchListState._internal();
}
