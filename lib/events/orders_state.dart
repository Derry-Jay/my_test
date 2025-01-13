import 'icon_state.dart';

class OrdersState extends IconState {
  static final OrdersState _singleton = OrdersState._internal();

  factory OrdersState() => _singleton;

  OrdersState._internal();
}
