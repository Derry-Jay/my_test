import 'package:flutter/material.dart';

<<<<<<< HEAD
import '../../../extensions/continuations.dart';
import '../../../extensions/extensions.dart';
=======
import 'package:common_utils/common_utils.dart';
>>>>>>> 173e49f246edfb412f5b21f9210c552cbaf91321

class PaddedSizedBox extends StatelessWidget {
  final Size? size;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  const PaddedSizedBox(
      {super.key, this.size, this.child, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return size.constrainChild(child: padding.paddedWidget(child: child));
=======
    return size.constrainChild(
        child: padding.setPaddingAroundWidget(child: child));
>>>>>>> 173e49f246edfb412f5b21f9210c552cbaf91321
  }
}
