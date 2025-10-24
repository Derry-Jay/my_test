// import 'package:common_utils/common_utils.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// import '../../../../data/values.dart';

// class CircularLoader extends StatefulWidget {
//   final int? count;
//   final BoxShape? shape;
//   final StrokeCap? strokeCap;
//   final LoaderType? loaderType;
//   final SpinKitWaveType? type2;
//   final Duration? duration, delay;
//   final SpinKitPianoWaveType? type1;
//   final Color? color, trackColor, waveColor;
//   final Widget Function(BuildContext, int)? itemBuilder;
//   final double? heightFactor, widthFactor, breadth, altitude, value;

//   const CircularLoader(
//       {super.key,
//       this.shape,
//       this.value,
//       this.type1,
//       this.type2,
//       this.color,
//       this.count,
//       this.delay,
//       this.breadth,
//       this.duration,
//       this.altitude,
//       this.strokeCap,
//       this.waveColor,
//       this.loaderType,
//       this.trackColor,
//       this.widthFactor,
//       this.itemBuilder,
//       this.heightFactor});

//   @override
//   CircularLoaderState createState() => CircularLoaderState();
// }

// class CircularLoaderState extends State<CircularLoader>
//     with SingleTickerProviderStateMixin {
//   Widget loaderBuilder(
//       BuildContext context, AsyncSnapshot<Progress> benchMark) {
//     Color c;
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.iOS:
//       case TargetPlatform.macOS:
//         c = widget.color ?? context.appleTheme.primaryColor;
//         break;
//       default:
//         c = widget.color ?? context.themeMaterial.primaryColor;
//         break;
//     }
//     return CircularProgressIndicator.adaptive(
//         strokeCap: widget.strokeCap,
//         valueColor: c.animationAlwaysStopped,
//         semanticsLabel: benchMark.data?.label,
//         semanticsValue: benchMark.data?.label,
//         value: benchMark.data?.value.toDouble(),
//         strokeWidth: widget.breadth ?? dimensions.xs3,
//         backgroundColor: context.themeMaterial.scaffoldBackgroundColor);
//   }

//   @override
//   Widget build(BuildContext context) {
//     cm.setItemCount(widget.count ?? 5);
//     switch (widget.loaderType) {
//       case LoaderType.normal:
//         return StreamBuilder<Progress>(
//             stream: cm.progress, builder: loaderBuilder);
//       default:
//         return RoundLoader(
//             color: widget.color,
//             delay: widget.delay,
//             shape: widget.shape,
//             type1: widget.type1,
//             type2: widget.type2,
//             value: widget.value,
//             breadth: widget.breadth,
//             altitude: widget.altitude,
//             duration: widget.duration,
//             strokeCap: widget.strokeCap,
//             waveColor: widget.waveColor,
//             loaderType: widget.loaderType,
//             trackColor: widget.trackColor,
//             itemBuilder: widget.itemBuilder,
//             widthFactor: widget.widthFactor,
//             heightFactor: widget.heightFactor);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     cm.assignState(this);
//   }
// }
