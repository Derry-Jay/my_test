import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../utils/enums.dart';
import '../../../../utils/values.dart';
import 'empty_widget.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final ButtonType? type;
  final Clip? clipBehavior;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final OutlinedBorder? shape;
  final bool? autoFocus, isFilled;
  final EdgeInsetsGeometry? padding;
  final Color? buttonColor, disabledColor;
  final VoidCallback? onPressed, onLongPress;
  final WidgetStatesController? statesController;
  final void Function(bool)? onHover, onFocusChange;
  CustomButton(
      {super.key,
      this.type,
      this.child,
      this.style,
      this.shape,
      this.onHover,
      this.padding,
      this.isFilled,
      this.focusNode,
      this.autoFocus,
      this.onPressed,
      this.buttonColor,
      this.onLongPress,
      this.clipBehavior,
      this.disabledColor,
      this.onFocusChange,
      this.statesController})
      : assert(isCupertino || type != null);

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
                onLongPress: onLongPress,
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
            return const EmptyWidget();
        }
    }
  }
}
