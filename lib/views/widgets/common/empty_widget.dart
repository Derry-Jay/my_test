import 'package:flutter/material.dart';

import '../../../extensions/continuations.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 0.0.squareConstrainChild();
  }
}
