import 'package:material_ui/material_ui.dart';

import 'package:common_utils/common_utils.dart';

class PaddedSizedBox extends StatelessWidget {
  final Size? size;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  const PaddedSizedBox(
      {super.key, this.size, this.child, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return size.constrainChild(
        child: padding.setPaddingAroundWidget(child: child));
  }
}
