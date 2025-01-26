import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/icon_bloc.dart';
import '../../../data/values.dart';
import '../../../extensions/extensions.dart';

import '../../../blocs/tab_bloc.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  Widget bottomBarBuilder(BuildContext ct2, int j) {
    final IconBloc iconBloc = ct2.getIconBloc(true);

    BottomNavigationBarItem mapItem(IconData di) =>
        di.iconBuilder().itemBottomNavigationBar(
            label: iconBloc
                .labels[iconBloc.icons.indexOf(di)].firstLetterCapitalized);
    return Material(
        color: shades.kBlack1,
        child: iconBloc.icons
            .map<BottomNavigationBarItem>(mapItem)
            .getBottomNavigationBar(index: j, onTap: iconBloc.setIndex));
  }

  Widget screenBuilder(BuildContext ct1, int i) {
    final TabBloc tabBloc = ct1.getTabBloc(true);
    return DefaultTabController(
        initialIndex: i,
        length: tabBloc.tabCount,
        child: Scaffold(
                body: tabBloc.tabContents.bodyOfTabs(),
                bottomNavigationBar:
                    BlocBuilder<IconBloc, int>(builder: bottomBarBuilder),
                appBar: AppBar(
                    actions: tabBloc.appBarActions,
                    title: 'Watchlist'.textWidget(),
                    bottom: PreferredSize(
                        preferredSize: <num>[ct1.width, ct1.height / 16].size,
                        child: <Widget>[
                          tabBloc.tabs
                              .placeWidgetsInTab()
                              .wrapWithExpanded(flex: 3),
                          Icons.ballot_outlined
                              .iconBuilder(color: rainbow.kGreen)
                              .wrapWithFlexible()
                        ].placeWidgetsHorizontally(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween))))
            .wrapWithinSafeArea());
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TabBloc, int>(builder: screenBuilder);
}
