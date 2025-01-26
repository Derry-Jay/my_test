import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/icon_bloc.dart';
import '../blocs/stock_bloc.dart';
import '../blocs/tab_bloc.dart';

extension Wup on String {
  T? valFromConfig<T extends Object?>() => gc?.getValue<T>(trimmed);
}

extension Assist on Map<String, Object?> {}

extension Helper<T extends BuildContext> on T {
  U getBlocProvider<U extends StateStreamableSource<Object?>>([bool? listen]) =>
      BlocProvider.of<U>(this, listen: listen ?? false);

  TabBloc getTabBloc([bool? listen]) => getBlocProvider<TabBloc>(listen);

  IconBloc getIconBloc([bool? listen]) => getBlocProvider<IconBloc>(listen);

  StockBloc getStockBloc([bool? listen]) => getBlocProvider<StockBloc>(listen);
}
