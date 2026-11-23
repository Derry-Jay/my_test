import 'stocks_state.dart';

class LoadedState extends StocksState {
  LoadedState._internal();

  static final LoadedState _singleton = LoadedState._internal();

  factory LoadedState() => _singleton;
}
