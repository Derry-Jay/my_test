import 'package:common_utils/common_utils.dart';
import 'package:material_ui/material_ui.dart';

// import '../../../data/values.dart';

class MyButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  const MyButton({super.key, this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onPressed: onPressed, //buttonColor: shades.kBlue, 
        child: child);
  }
}
