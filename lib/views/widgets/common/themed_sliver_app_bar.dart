import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/values.dart';

class ThemedSliverAppBar extends StatelessWidget {
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? shadowColor, surfaceTintColor;
  final Widget? title, leading, flexibleSpace;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Future<void> Function()? onStretchTrigger;
  final IconThemeData? iconTheme, actionsIconTheme;
  final TextStyle? toolbarTextStyle, titleTextStyle;
  final bool? snap,
      pinned,
      stretch,
      primary,
      floating,
      centerTitle,
      forceElevated,
      excludeHeaderSemantics,
      automaticallyImplyLeading,
      forceMaterialTransparency;
  final double? elevation,
      titleSpacing,
      leadingWidth,
      bottomOpacity,
      toolbarHeight,
      toolbarOpacity,
      expandedHeight,
      collapsedHeight,
      stretchTriggerOffset,
      scrolledUnderElevation;
  const ThemedSliverAppBar(
      {super.key,
      this.snap,
      this.title,
      this.shape,
      this.bottom,
      this.pinned,
      this.stretch,
      this.actions,
      this.leading,
      this.primary,
      this.floating,
      this.elevation,
      this.iconTheme,
      this.shadowColor,
      this.centerTitle,
      this.clipBehavior,
      this.titleSpacing,
      this.leadingWidth,
      this.flexibleSpace,
      this.bottomOpacity,
      this.toolbarHeight,
      this.forceElevated,
      this.expandedHeight,
      this.toolbarOpacity,
      this.titleTextStyle,
      this.collapsedHeight,
      this.onStretchTrigger,
      this.surfaceTintColor,
      this.actionsIconTheme,
      this.toolbarTextStyle,
      this.systemOverlayStyle,
      this.stretchTriggerOffset,
      this.excludeHeaderSemantics,
      this.scrolledUnderElevation,
      this.forceMaterialTransparency,
      this.automaticallyImplyLeading});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
        title: title,
        shape: shape,
        bottom: bottom,
        actions: actions,
        leading: leading,
        snap: snap ?? false,
        iconTheme: iconTheme,
        elevation: elevation,
        pinned: pinned ?? false,
        shadowColor: shadowColor,
        centerTitle: centerTitle,
        primary: primary ?? true,
        stretch: stretch ?? false,
        clipBehavior: clipBehavior,
        titleSpacing: titleSpacing,
        leadingWidth: leadingWidth,
        floating: floating ?? false,
        flexibleSpace: flexibleSpace,
        expandedHeight: expandedHeight,
        titleTextStyle: titleTextStyle,
        toolbarTextStyle: titleTextStyle,
        collapsedHeight: collapsedHeight,
        onStretchTrigger: onStretchTrigger,
        surfaceTintColor: surfaceTintColor,
        actionsIconTheme: actionsIconTheme,
        forceElevated: forceElevated ?? false,
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: context.themeMaterial.primaryColor,
        scrolledUnderElevation: scrolledUnderElevation,
        foregroundColor: context.themeMaterial.secondaryHeaderColor,
        excludeHeaderSemantics: excludeHeaderSemantics ?? false,
        toolbarHeight: toolbarHeight ?? measurements.toolbarHeight,
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        forceMaterialTransparency: forceMaterialTransparency ?? false,
        stretchTriggerOffset:
            stretchTriggerOffset ?? measurements.stretchTriggerOffset);
  }
}
