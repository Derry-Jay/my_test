import 'stocks_state.dart';

class LoadingState extends StocksState {
  LoadingState._internal();

  static final LoadingState _singleton = LoadingState._internal();

  factory LoadingState() => _singleton;
}
