import 'tab_state.dart';

class BankNiftyState extends TabState {
  static final BankNiftyState _singleton = BankNiftyState._internal();

  factory BankNiftyState() => _singleton;

  BankNiftyState._internal();
}
