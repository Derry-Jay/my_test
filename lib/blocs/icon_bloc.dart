import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/icon_state.dart';
import '../events/more_state.dart';
import '../events/movers_state.dart';
import '../events/orders_state.dart';
import '../events/portfolio_state.dart';
import '../events/watch_list_state.dart';

class IconBloc extends Bloc<IconState, int> {
  late BuildContext _buildContext;

  final List<String> labels = <String>[
    'Watchlist',
    'Orders',
    'Portfolio',
    'Movers',
    'More'
  ];

  final List<IconData> icons = <IconData>[
    Icons.bookmark_rounded,
    Icons.shopping_bag_outlined,
    Icons.business_center_outlined,
    Icons.insert_chart_outlined_outlined,
    Icons.more_vert_rounded
  ];

  IconBloc(BuildContext context) : super(0) {
    _buildContext = context;
    on<WatchListState>((WatchListState event, Emitter<int> emit) {
      emit(0);
    });
    on<OrdersState>((OrdersState event, Emitter<int> emit) {
      emit(1);
    });
    on<PortfolioState>((PortfolioState event, Emitter<int> emit) {
      emit(2);
    });
    on<MoversState>((MoversState event, Emitter<int> emit) {
      emit(3);
    });
    on<MoreState>((MoreState event, Emitter<int> emit) {
      emit(4);
    });
  }

  BuildContext get context => (navKey.currentState?.context ??
      (wb?.buildOwner?.focusManager.rootScope.context ?? _buildContext));

  void setIndex(int idx) {
    switch (idx) {
      case 0:
        add(WatchListState());
        break;
      case 1:
        add(OrdersState());
        break;
      case 2:
        add(PortfolioState());
        break;
      case 3:
        add(MoversState());
        break;
      case 4:
        add(MoreState());
        break;
      default:
    }
  }
}
