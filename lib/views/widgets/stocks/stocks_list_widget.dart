import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/stock_bloc.dart';
import '../../../extensions/extensions.dart';
import '../../../models/stocks/stock.dart';
import '../../../utils/methods.dart';
import 'stock_item_widget.dart';

class StocksListWidget extends StatefulWidget {
  const StocksListWidget({super.key});

  @override
  State<StocksListWidget> createState() => _StocksListWidgetState();
}

class _StocksListWidgetState extends State<StocksListWidget> {
  Widget listBuilder(BuildContext ct1, Iterable<Stock>? stocks) {
    Widget itemBuilder(BuildContext ct2, int i) {
      return StockItemWidget(
          stock: stocks?.toList()[i] ?? Stock.emptyStock, idx: i);
    }

    return stocks == null
        ? const RoundLoader()
        : ListView.separated(
            itemBuilder: itemBuilder,
            itemCount: stocks.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            separatorBuilder: stocksSeparatorBuilder);
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<StockBloc, Iterable<Stock>?>(builder: listBuilder);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.getStockBloc().getStocks();
  }
}
