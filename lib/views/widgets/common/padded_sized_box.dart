import 'package:flutter/material.dart';

import '../../../extensions/continuations.dart';
import '../../../extensions/extensions.dart';

class PaddedSizedBox extends StatelessWidget {
  final Size? size;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  const PaddedSizedBox(
      {super.key, this.size, this.child, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return size.constrainChild(child: padding.paddedWidget(child: child));
  }
}
