<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test/extensions/extensions.dart';

import '../../../utils/values.dart';
import '../../widgets/common/screen_layout.dart';
import '../../widgets/common/themed_material_app_bar.dart';
=======
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
>>>>>>> 173e49f246edfb412f5b21f9210c552cbaf91321

class AnyScreen extends StatelessWidget {
  const AnyScreen({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final button =
        Icons.ac_unit.iconBuilder(color: shades.kDeepPurple).iconButtonBuilder(
      onPressed: () {
        6.4.isPerfectSquare.jot();
        64.isPerfectSquare.jot();
        58.isPerfectSquare.jot();
        6.25.isPerfectSquare.jot();
        <int>[5, 1, 2, 4, 3].sortedElements().jot();
        ['delete', 'deluge'].commonPattern.jot();
        ['definition', 'definitely', 'definite'].commonPattern.jot();
      },
    );
    return ScreenLayout(
        appBar: ThemedMaterialAppBar(
          title: 'Any Screen'.toText(),
          actions: [button],
        ),
        navigationBar: CupertinoNavigationBar(trailing: button),
        content: ListView.separated(
            itemBuilder: cm.getRecordItem,
            separatorBuilder: cm.listItemSeparator,
            itemCount: cm.accountRecordHistory.length));
=======
    // final IconButton button =
    //     Icons.ac_unit.iconBuilder(color: rainbow.kWhite).iconButtonBuilder(
    //   onPressed: () {
    //     6.4.isPerfectSquare.jot();
    //     64.isPerfectSquare.jot();
    //     58.isPerfectSquare.jot();
    //     6.25.isPerfectSquare.jot();
    //     <int>[5, 1, 2, 4, 3].sortedElements().jot();
    //     <String>['delete', 'deluge'].commonPatterns.jot();
    //     <String>['definition', 'definitely', 'definite'].commonPatterns.jot();
    //   },
    // );
    return ScreenLayout(
        // appBar: ThemedMaterialAppBar(
        //   title: 'Any Screen'.toText(),
        //   actions: <IconButton>[button],
        // ),
        // navigationBar: CupertinoNavigationBar(trailing: button),
        // content: ListView.separated(
        //     itemBuilder: cm.getRecordItem,
        //     separatorBuilder: cm.listItemSeparator,
        //     itemCount: cm.accountRecordHistory.length)
            );
>>>>>>> 173e49f246edfb412f5b21f9210c552cbaf91321
  }
}
