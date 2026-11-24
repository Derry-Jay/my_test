import 'package:material_ui/material_ui.dart';

import 'package:common_utils/common_utils.dart';
import 'my_app.dart';

void main() async {
  try {
    await 'config'.appInitialized()
        ? runApp(const MyApp())
        : doNothing();
  } catch (e) {
    e.jot();
  }
}
