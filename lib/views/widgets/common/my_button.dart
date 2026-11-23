import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

// import '../../../data/values.dart';

class MyButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
<<<<<<< HEAD
  const MyButton({super.key, this.type, this.child, this.onPressed});
=======
  const MyButton({super.key, this.child, required this.onPressed});
>>>>>>> 173e49f246edfb412f5b21f9210c552cbaf91321

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onPressed: onPressed, //buttonColor: shades.kBlue, 
        child: child);
  }
}
