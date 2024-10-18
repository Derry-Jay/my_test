import 'package:flutter/material.dart';

import '../../../extensions/continuations.dart';
import '../../../extensions/extensions.dart';
import '../../../utils/values.dart';
import '../../widgets/common/screen_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenLayout(
      content: context.nonNullSize.constrainChild(
          child: 
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(child: acf.name.textWidget()),
        // Flexible(
        //     child: ),
        //     Flexible(
        //         child: )
        // Flexible(
        //     child: )
        // Flexible(
        //     child: )
      ])),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cm.nextScreen();
  }
}
