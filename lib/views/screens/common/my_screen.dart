import 'package:flutter/material.dart';
import 'package:my_test/extensions/continuations.dart';
import 'package:my_test/extensions/extensions.dart';

import '../../../utils/enums.dart';
import '../../../utils/values.dart';
import '../../widgets/common/empty_widget.dart';
import '../../widgets/common/my_button.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

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
        // assets.bigImage
        //     .getImageFromAsset(fit: BoxFit.fill)
        //     .wrapWithFlexible(flex: 10),
        'Unsupported device resolution'
            .textWidget(
                style: 'manrope'.getStyleFromFont(
                    height: 1, fontSize: 30, fontWeight: FontWeight.w700))
            .wrapWithFlexible(flex: 2),
        "'Profile' is not available on your device due to resolution limitations. To use this feature, please switch to the web version, which supports the necessary resolution."
            .textWidget(
                style: 'manrope'.getStyleFromFont(height: 1.5, fontSize: 17.5))
            .wrapWithFlexible(flex: 2),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          assets.flashImage.getImageFromAsset().wrapWithFlexible(),
          (context.width / 80).sizeFromWidth.constrainChild().wrapWithFlexible(),
          'Happy trading!'
              .textWidget(
                  style: 'manrope'.getStyleFromFont(
                      height: 1.5, fontSize: 17.5, fontWeight: FontWeight.w600))
              .wrapWithFlexible()
        ]).wrapWithFlexible(),
        const EmptyWidget().wrapWithExpanded(flex: 3),
        const EmptyWidget().wrapWithExpanded(flex: 3),
        MyButton(
                onPressed: () {},
                type: ButtonType.raised,
                child: 'Explore more products'.textWidget())
            .wrapWithFlexible(flex: 2)
      ]))),
    );
  }
}
