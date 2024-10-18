import 'package:flutter/material.dart';

import '../../widgets/common/screen_layout.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const SafeArea(
      child: ScreenLayout(content: Placeholder()),
    );
  }
}
