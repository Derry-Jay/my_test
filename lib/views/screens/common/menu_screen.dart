import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:june/june.dart';
// import '../../../extensions/continuations.dart';
import 'package:my_test/utils/methods.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/values.dart';
import '../../widgets/common/screen_layout.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final button =
        Icons.abc.iconBuilder().iconButtonBuilder(onPressed: cm.incrementCount);
    return ScreenLayout(
        bottomNavigationBar: button,
        navigationBar: CupertinoNavigationBar(
          trailing: button,
          middle: 'Menu'.textWidget(),
        ),
        appBar: AppBar(
          title: 'Menu'.textWidget(),
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
        content: const JuneBuilder(obtainCommonState, builder: numberBuilder));
  }
}
