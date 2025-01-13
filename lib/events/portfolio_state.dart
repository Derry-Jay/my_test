import 'icon_state.dart';

class PortfolioState extends IconState {
  static final PortfolioState _singleton = PortfolioState._internal();

  factory PortfolioState() => _singleton;

  PortfolioState._internal();
}
