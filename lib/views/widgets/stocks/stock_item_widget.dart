import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import '../../../data/values.dart';
import '../../../models/stocks/stock.dart';

class StockItemWidget extends StatelessWidget {
  final int idx;
  final Stock stock;
  const StockItemWidget({super.key, required this.idx, required this.stock});

  @override
  Widget build(BuildContext context) {
    return <num>[context.width, context.height / 16].size.constrainChild(
            child: <Widget>[
          <Widget>[
            stock.name.upperCased
                .textWidget(style: css.stockTitleStyle)
                .wrapWithFlexible(),
            <Widget>[
              (stock.variation > 0
                      ? Icons.arrow_drop_up_outlined
                      : (stock.variation < 0
                          ? Icons.arrow_drop_down_outlined
                          : Icons.dehaze_sharp))
                  .iconBuilder(
                      color: stock.variation > 0
                          ? rainbow.kGreen
                          : (stock.variation < 0
                              ? context.themeMaterial.colorScheme.error
                              : shades.kWhite1))
                  .wrapWithFlexible(),
              stock.value.string
                  .textWidget(
                      style: css.stockTitleStyle.copyWith(
                          color: stock.variation > 0
                              ? rainbow.kGreen
                              : (stock.variation < 0
                                  ? context.themeMaterial.colorScheme.error
                                  : shades.kWhite1)))
                  .wrapWithFlexible()
            ]
                .placeWidgetsHorizontally(
                    mainAxisAlignment: MainAxisAlignment.end)
                .wrapWithFlexible()
          ]
              .placeWidgetsHorizontally(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween)
              .wrapWithFlexible(),
          <Widget>[
            (stock.count > 0
                    ? <Widget>[
                        stock.type.upperCased
                            .textWidget(style: css.stockSubscriptStyle)
                            .wrapWithFlexible(),
                        <Widget>[
                          Icons.business_center_outlined
                              .iconBuilder(color: rainbow.kGrey)
                              .wrapWithFlexible(),
                          stock.count.string
                              .textWidget(style: css.stockInfoStyle)
                              .wrapWithFlexible(flex: 3)
                        ]
                            .placeWidgetsHorizontally(
                                mainAxisAlignment: MainAxisAlignment.start)
                            .wrapWithFlexible()
                      ].placeWidgetsHorizontally(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween)
                    : stock.type.upperCased
                        .textWidget(style: css.stockSubscriptStyle))
                .wrapWithFlexible(),
            '${stock.variation > 0 ? "+" : ""}${stock.variation} (${stock.variationPercent}%)'
                .textWidget(style: css.stockInfoStyle)
                .wrapWithFlexible()
          ]
              .placeWidgetsHorizontally(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween)
              .wrapWithFlexible()
        ].placeWidgetsVertically(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween));
  }
}
