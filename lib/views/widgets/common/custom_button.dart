import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_test/utils/values.dart';

import '../../../../utils/enums.dart';
import '../../../utils/methods.dart';
import 'empty_widget.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final ButtonType? type;
  final Clip? clipBehavior;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autoFocus, isFilled;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed, onLongPress;
  final WidgetStatesController? statesController;
  final void Function(bool)? onHover, onFocusChange;
  final double? focusElevation,
      hoverElevation,
      disabledElevation,
      highlightElevation;
  final Color? buttonColor,
      focusColor,
      hoverColor,
      splashColor,
      disabledColor,
      highlightColor;
  const CustomButton(
      {super.key,
      this.type,
      this.child,
      this.style,
      this.onHover,
      this.padding,
      this.isFilled,
      this.focusNode,
      this.autoFocus,
      this.onPressed,
      this.focusColor,
      this.hoverColor,
      this.buttonColor,
      this.splashColor,
      this.onLongPress,
      this.clipBehavior,
      this.disabledColor,
      this.onFocusChange,
      this.focusElevation,
      this.hoverElevation,
      this.highlightColor,
      this.statesController,
      this.disabledElevation,
      this.highlightElevation});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return (isFilled ?? false)
            ? CupertinoButton.filled(
                onPressed: onPressed, child: child ?? const EmptyWidget())
            : CupertinoButton(
                padding: padding,
                color: buttonColor,
                onPressed: onPressed,
                disabledColor:
                    disabledColor ?? CupertinoColors.quaternarySystemFill,
                child: child ?? const EmptyWidget());
      default:
        switch (type) {
          case ButtonType.raised:
            return ElevatedButton(
                style: style,
                onHover: onHover,
                onPressed: onPressed,
                focusNode: focusNode,
                onFocusChange: onFocusChange,
                autofocus: autoFocus ?? false,
                statesController: statesController,
                clipBehavior: clipBehavior ?? Clip.none,
                child: child);
          case ButtonType.border:
            return OutlinedButton(
                style: style,
                onHover: onHover,
                onPressed: onPressed,
                focusNode: focusNode,
                onLongPress: onLongPress,
                onFocusChange: onFocusChange,
                autofocus: autoFocus ?? false,
                statesController: statesController,
                clipBehavior: clipBehavior ?? Clip.none,
                child: child);
          case ButtonType.text:
            return TextButton(
                style: style,
                onHover: onHover,
                onPressed: onPressed,
                focusNode: focusNode,
                onLongPress: onLongPress,
                onFocusChange: onFocusChange,
                autofocus: autoFocus ?? false,
                statesController: statesController,
                clipBehavior: clipBehavior ?? Clip.none,
                child: child ?? const EmptyWidget());
          default:
            final Set<WidgetState> states =
                statesController?.value ?? WidgetState.values.toSet();
            return RawMaterialButton(
                onPressed: onPressed,
                focusNode: focusNode,
                fillColor: buttonColor,
                focusColor: focusColor,
                hoverColor: hoverColor,
                onLongPress: onLongPress,
                splashColor: splashColor,
                autofocus: autoFocus ?? false,
                highlightColor: highlightColor,
                onHighlightChanged: onFocusChange,
                padding: padding ?? css.zeroPadding,
                focusElevation: focusElevation ?? 4.0,
                hoverElevation: hoverElevation ?? 4.0,
                clipBehavior: clipBehavior ?? Clip.none,
                disabledElevation: disabledElevation ?? 0.0,
                materialTapTargetSize: style?.tapTargetSize,
                textStyle: style?.textStyle?.resolve(states),
                highlightElevation: highlightElevation ?? 8.0,
                enableFeedback: style?.enableFeedback ?? true,
                mouseCursor: style?.mouseCursor?.resolve(states),
                elevation: style?.elevation?.resolve(states) ?? 2.0,
                visualDensity: style?.visualDensity ?? VisualDensity.standard,
                animationDuration:
                    style?.animationDuration ?? kThemeChangeDuration,
                shape: style?.shape?.resolve(states) ??
                    const RoundedRectangleBorder(),
                constraints: boxConstraints(
                    maximum: style?.maximumSize?.resolve(states),
                    minimum: Size(
                        style?.minimumSize?.resolve(states)?.width ??
                            measurements.defaultRawMaterialButtonMinWidth,
                        style?.minimumSize?.resolve(states)?.height ??
                            measurements.defaultRawMaterialButtonMinHeight)),
                child: child);
        }
    }
  }
}
