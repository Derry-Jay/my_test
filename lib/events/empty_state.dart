import 'stocks_state.dart';

class EmptyState extends StocksState {
  EmptyState._internal();

  static final EmptyState _singleton = EmptyState._internal();

  factory EmptyState() => _singleton;
}
