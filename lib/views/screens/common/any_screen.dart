import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_test/extensions/extensions.dart';

import '../../../utils/values.dart';
import '../../widgets/common/screen_layout.dart';
import '../../widgets/common/themed_material_app_bar.dart';

class AnyScreen extends StatelessWidget {
  const AnyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: 'Any Screen'.textWidget(),
          actions: [button],
        ),
        navigationBar: CupertinoNavigationBar(trailing: button),
        content: ListView.separated(
            itemBuilder: cm.getRecordItem,
            separatorBuilder: cm.listItemSeparator,
            itemCount: cm.accountRecordHistory.length));
  }
}
