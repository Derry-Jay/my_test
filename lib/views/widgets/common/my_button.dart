import 'package:flutter/material.dart';
import 'package:my_test/extensions/extensions.dart';
import 'package:my_test/utils/enums.dart';

import '../../../utils/values.dart';
import 'custom_button.dart';

class MyButton extends StatelessWidget {
  final Widget? child;
  final ButtonType? type;
  final VoidCallback? onPressed;
  const MyButton({super.key, this.type, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        type: type,
        onPressed: onPressed,
        buttonColor: shades.kPurple,
        style: ButtonStyle(
            shape:
                RoundedRectangleBorder(borderRadius: 4.0.circularBorderRadius)
                    .allWidgetStateProperty<OutlinedBorder?>(),
            fixedSize: Size(context.width * 0.9, context.height / 16)
                .allWidgetStateProperty<Size?>(),
            foregroundColor: shades.kWhite.allWidgetStateProperty<Color?>(),
            backgroundColor: shades.kPurple.allWidgetStateProperty<Color?>()),
        child: child);
  }
}
