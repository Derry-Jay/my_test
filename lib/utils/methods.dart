import 'package:flutter/material.dart';
import '../blocs/stock_bloc.dart';
import '../blocs/tab_bloc.dart';
import '../blocs/icon_bloc.dart';

TabBloc getTab(BuildContext context) => TabBloc(context);

IconBloc getIcon(BuildContext context) => IconBloc(context);

StockBloc getStock(BuildContext context) => StockBloc(context);

Widget stocksSeparatorBuilder(BuildContext context, int? i) {
  return Divider();
}
