import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/values.dart';
import '../events/bank_nifty_state.dart';
import '../events/nifty_state.dart';
import '../events/sensex_state.dart';
import '../events/tab_state.dart';
import '../events/two_state.dart';
import '../extensions/extensions.dart';
import '../views/widgets/stocks/stocks_list_widget.dart';

class TabBloc extends Bloc<TabState, int> {
  late BuildContext _buildContext;

  late List<Widget> tabContents;

  final int tabCount = 4;

  final List<Widget> appBarActions = <Widget>[
        45.rotatedTransform(child: Icons.push_pin_outlined.iconBuilder())
      ],
      tabs = <Widget>[
        Tab(text: '2'),
        Tab(text: 'NIFTY'),
        Tab(text: 'BANKNIFTY'),
        Tab(text: 'SENSEX')
      ];

  TabBloc(BuildContext context) : super(0) {
    on<TwoState>((TwoState event, Emitter<int> emit) {
      emit(0);
    });
    on<NiftyState>((NiftyState event, Emitter<int> emit) {
      emit(1);
    });
    on<BankNiftyState>((BankNiftyState event, Emitter<int> emit) {
      emit(2);
    });
    on<SensexState>((SensexState event, Emitter<int> emit) {
      emit(3);
    });
    _buildContext = context;
    tabContents = <Widget>[
      <num>[
        navKey.currentState?.context.width ?? 0.0,
        navKey.currentState?.context.height ?? 0.0 / 1.024
      ].size.constrainChild(
              child: <Widget>[
            EdgeInsets.symmetric(
                    horizontal:
                        (navKey.currentState?.context.width ?? 0.0) / 20)
                .paddedWidget(
                    child: CustomTextField(
                  onTap: () {
                    'Hi'.jot();
                    add(NiftyState());
                  },
                  material: InputDecoration(
                      // hintText: 'Search & Add',
                      labelText: 'Search & Add',
                      prefixIcon: Icons.search_outlined
                          .iconBuilder(color: shades.kWhite1),
                      suffixIcon: <Widget>[
                        Container(
                            height: 39.5,
                            color: shades.kWhite1,
                            width: dimensions.unitWb,
                            margin: EdgeInsets.only(bottom: 5)),
                        Icons.apps.iconBuilder(
                            size: measurements.customIconSize,
                            color: rainbow.kGreen),
                        90.rotatedTransform(
                            child: Icons.tune_outlined.iconBuilder(
                                size: measurements.customIconSize,
                                color: rainbow.kGreen)),
                        EmptyWidget(),
                        EmptyWidget(),
                        EmptyWidget(),
                        EmptyWidget(),
                        EmptyWidget(),
                        EmptyWidget(),
                        EmptyWidget()
                      ].placeWidgetsHorizontally(
                          spacing: dimensions.unitWb,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end)),
                ))
                .wrapWithFlexible(),
            StocksListWidget().wrapWithFlexible(flex: 3),
            ('${navKey.currentState?.context.getStockBloc().state?.length.string ?? "4"}/50 Stocks')
                .textWidget(style: css.stockSubscriptStyle)
                .wrapWithFlexible(),
            Container(
                decoration: null.boxDecoration(color: shades.kBlack2),
                width: (navKey.currentState?.context.width ?? 0) / 3.2768,
                child: <Widget>[
                  Icons.edit_square.iconBuilder(color: rainbow.kGreen),
                  'Edit Watchlist'.textWidget(style: css.stockSubscriptStyle)
                ].placeWidgetsHorizontally(
                    spacing: 5, mainAxisAlignment: MainAxisAlignment.center))
          ].placeWidgetsVertically(
                  mainAxisAlignment: MainAxisAlignment.spaceAround)),
      EmptyWidget(),
      EmptyWidget(),
      EmptyWidget()
    ];
  }

  BuildContext get bc => (navKey.currentState?.context ??
      (wb?.buildOwner?.focusManager.rootScope.context ?? _buildContext));

  void onTextFieldTap() {
    add(NiftyState());
  }
}
