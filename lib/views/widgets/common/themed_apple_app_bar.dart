import 'package:flutter/cupertino.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/keys.dart';
import '../../../utils/values.dart';

class ThemedAppleAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final Border? border;
  final Brightness? brightness;
  final String? previousPageTitle;
  final EdgeInsetsDirectional? padding;
  final Widget? middle, leading, trailing;
  final bool? automaticallyImplyMiddle,
      automaticallyImplyLeading,
      transitionBetweenRoutes;
  const ThemedAppleAppBar(
      {super.key,
      this.border,
      this.padding,
      this.middle,
      this.leading,
      this.trailing,
      this.brightness,
      this.previousPageTitle,
      this.automaticallyImplyMiddle,
      this.automaticallyImplyLeading,
      this.transitionBetweenRoutes});

  BuildContext? get bc =>
      navKey.currentContext ??
      (wb?.buildOwner?.focusManager.rootScope.context ?? wb?.rootElement);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
        middle: middle,
        leading: leading,
        padding: padding,
        trailing: trailing,
        brightness: brightness,
        previousPageTitle: previousPageTitle,
        border: border ?? css.defaultAppleAppBarBorder,
        backgroundColor: context.appleTheme.primaryColor,
        transitionBetweenRoutes: transitionBetweenRoutes ?? true,
        automaticallyImplyMiddle: automaticallyImplyMiddle ?? true,
        automaticallyImplyLeading: automaticallyImplyLeading ?? true);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      ((bc?.height ?? (32 * kMinInteractiveDimensionCupertino)) / 16)
          .sizeFromHeight;

  @override
  bool shouldFullyObstruct(BuildContext context) {
    // TODO: implement shouldFullyObstruct
    return false;
  }
}
