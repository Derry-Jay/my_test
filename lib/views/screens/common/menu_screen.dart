import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:my_test/extensions/continuations.dart';
// import '../../../extensions/continuations.dart';
import 'package:my_test/utils/methods.dart';
import 'package:my_test/views/widgets/common/custom_button.dart';
import 'package:my_test/views/widgets/common/my_button.dart';

import '../../../extensions/extensions.dart';
import '../../../states/common_state.dart';
import '../../../utils/values.dart';
import '../../widgets/common/screen_layout.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final count = const JuneBuilder<CommonState>(obtainCommonState,
            builder: numberBuilder),
        button = Icons.abc
            .iconBuilder()
            .iconButtonBuilder(onPressed: cm.incrementCount);
    return ScreenLayout(
        bottomNavigationBar: button,
        navigationBar: CupertinoNavigationBar(middle: count, trailing: button),
        appBar: AppBar(title: count, actions: [button]
            // flexibleSpace: Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: [
            //           Color(gradient1),
            //           Color(gradient2),
            //         ],
            //         begin: const FractionalOffset(0.0, 0.0),
            //         end: const FractionalOffset(1.0, 0.0),
            //         stops: const [0.0, 1.0],
            //         tileMode: TileMode.clamp),
            //   ),
            // ),
            ),
        content: Duration(milliseconds: 500).animatedContainer(
            width: context.width,
            margin: 8.0.allEdgeInsets,
            padding: 8.0.allEdgeInsets,
            height: context.height / 3.2768,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: (context.radius / 160).circularRadius),
                gradient: <Color>[
                  0xFFFFC4C2.color,
                  0xFFFFE4E2.color,
                  Colors.white
                ].linearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: <double>[0.1, 0.3, 0.7])),
            child: <Widget>[
              assets.exitFlow
                  .getImageFromAssetOrNetwork()
                  .wrapWithFlexible(flex: 4),
              EdgeInsets.symmetric(vertical: context.height / 128)
                  .paddedWidget(
                      child: 'Exit Flow'.textWidget(
                          style: 'manrope'.getStyleFromFont(
                              height: 1.25,
                              fontSize: 20,
                              fontWeight: 700.fontWeight)))
                  .wrapWithFlexible(flex: 3),
              'Are you sure you want to exit the flow?'
                  .textWidget(
                      style:
                          'manrope'.getStyleFromFont(height: 1.5, fontSize: 14))
                  .wrapWithFlexible(flex: 2),
              <Widget>[
                MyButton(onPressed: () {}, child: 'Confirm'.textWidget())
                    .wrapWithFlexible(),
                CustomButton(onPressed: () {}, child: 'Cancel'.textWidget())
                    .wrapWithFlexible()
              ]
                  .placeWidgetsHorizontally(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly)
                  .wrapWithFlexible(flex: 7)
            ].placeWidgetsVertically(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start)));
  }
}
