import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/empty_state.dart';
import '../events/loaded_state.dart';
import '../events/loading_state.dart';
import '../events/stocks_state.dart';
import '../models/stocks/stock.dart';

class StockBloc extends Bloc<StocksState, Iterable<Stock>?> {
  late BuildContext _buildContext;
  StockBloc(BuildContext context) : super(null) {
    _buildContext = context;
    on<LoadingState>((LoadingState event, Emitter<Iterable<Stock>?> emit) {
      emit(null);
    });
    on<LoadedState>((LoadedState event, Emitter<Iterable<Stock>?> emit) {
      emit(<Stock>[
        Stock('gold 26jul 59500 ce', 298.50, 0, 23.50, 8.54, 'mcx'),
        Stock('accelya', 1337.70, 0, 1.05, 0.07, 'nse'),
        Stock('acc', 1795.20, 400, 27.20, 1.53, 'bse'),
        Stock('acc', 1792.30, 400, 25.40, 1.43, 'nse')
      ]);
    });
    on<EmptyState>((EmptyState event, Emitter<Iterable<Stock>?> emit) {
      emit(<Stock>[]);
    });
  }

  BuildContext get context => (navKey.currentState?.context ??
      (wb?.buildOwner?.focusManager.rootScope.context ?? _buildContext));

  void getStocks() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    add(LoadedState());
  }
}
