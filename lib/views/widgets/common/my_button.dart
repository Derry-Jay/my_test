import 'package:flutter/material.dart';

import '../../../utils/values.dart';
import 'custom_button.dart';

class MyButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  const MyButton({super.key, this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onPressed: onPressed, buttonColor: shades.kBlue, child: child);
  }
}
