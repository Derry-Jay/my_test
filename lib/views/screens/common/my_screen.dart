import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/icon_bloc.dart';
import '../../../data/values.dart';
import '../../../extensions/extensions.dart';

import '../../../blocs/tab_bloc.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    assets.bigImage.jot();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Camera example'),
      // ),
      body: EdgeInsets.symmetric(horizontal: 10).paddedWidget(
          child: context.nonNullSize.constrainChild(
              child: Column(children: <Widget>[
        assets.bigImage
            .getImageFromAssetOrNetwork(fit: BoxFit.fill)
            .wrapWithFlexible(flex: 5),
        'Unsupported device resolution'
            .toText(
                style: 'manrope'.fontFamilyToTextStyle(
                    height: 1, fontSize: 30, fontWeight: FontWeight.w700))
            .wrapWithFlexible(flex: 2),
        "'Profile' is not available on your device due to resolution limitations. To use this feature, please switch to the web version, which supports the necessary resolution."
            .toText(
                style: 'manrope'.fontFamilyToTextStyle(height: 1.5, fontSize: 17.5))
            .wrapWithFlexible(flex: 2),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          assets.flashImage.getImageFromAssetOrNetwork().wrapWithFlexible(),
          (context.width / 80)
              .sizeFromWidth
              .constrainChild()
              .wrapWithFlexible(),
          'Happy trading!'
              .toText(
                  style: 'manrope'.fontFamilyToTextStyle(
                      height: 1.5, fontSize: 17.5, fontWeight: FontWeight.w600))
              .wrapWithFlexible()
        ]).wrapWithFlexible(),
        const EmptyWidget().wrapWithExpanded(flex: 3),
        const EmptyWidget().wrapWithExpanded(flex: 3),
        MyButton(
                onPressed: () {},
                type: ButtonType.raised,
                child: 'Explore more products'.toText())
            .wrapWithFlexible(flex: 2)
      ]))),
    );
=======
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
            .barBottomNavigation(index: j, onTap: iconBloc.setIndex));
>>>>>>> 173e49f246edfb412f5b21f9210c552cbaf91321
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
                    title: 'Watchlist'.toText(),
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
