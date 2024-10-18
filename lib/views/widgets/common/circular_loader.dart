import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../extensions/extensions.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/values.dart';
import '../../../models/common/progress.dart';

class CircularLoader extends StatefulWidget {
  final int? count;
  final BoxShape? shape;
  final StrokeCap? strokeCap;
  final LoaderType? loaderType;
  final SpinKitWaveType? type2;
  final Duration? duration, delay;
  final SpinKitPianoWaveType? type1;
  final Color? color, trackColor, waveColor;
  final Widget Function(BuildContext, int)? itemBuilder;
  final double? heightFactor, widthFactor, breadth, altitude, value;

  const CircularLoader(
      {super.key,
      this.shape,
      this.value,
      this.type1,
      this.type2,
      this.color,
      this.count,
      this.delay,
      this.breadth,
      this.duration,
      this.altitude,
      this.strokeCap,
      this.waveColor,
      this.loaderType,
      this.trackColor,
      this.widthFactor,
      this.itemBuilder,
      this.heightFactor});

  @override
  CircularLoaderState createState() => CircularLoaderState();
}

class CircularLoaderState extends State<CircularLoader>
    with SingleTickerProviderStateMixin {
  Widget loaderBuilder(
      BuildContext context, AsyncSnapshot<Progress> benchMark) {
    Color c;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        c = widget.color ?? context.appleTheme.primaryColor;
        break;
      default:
        c = widget.color ?? context.themeMaterial.primaryColor;
        break;
    }
    return CircularProgressIndicator.adaptive(
        strokeCap: widget.strokeCap,
        semanticsLabel: benchMark.data?.label,
        semanticsValue: benchMark.data?.label,
        value: benchMark.data?.value.toDouble(),
        valueColor: AlwaysStoppedAnimation<Color?>(c),
        strokeWidth: widget.breadth ?? measurements.xs3,
        backgroundColor: context.themeMaterial.scaffoldBackgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    // final val = cm.animation?.value ?? 100;
    // final opacity = val > 100.0 ? 1.0 : val / 100;
    Color c;
    Widget lc;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        c = widget.color ?? context.appleTheme.primaryColor;
        break;
      default:
        c = widget.color ?? context.themeMaterial.primaryColor;
        break;
    }
    cm.setItemCount(widget.count ?? 5);
    switch (widget.loaderType) {
      case LoaderType.chasingDots:
        lc = SpinKitChasingDots(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ?? const Duration(seconds: 2));
        break;
      case LoaderType.circle:
        lc = SpinKitCircle(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.cubeGrid:
        lc = SpinKitCubeGrid(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.dancingSquare:
        lc = SpinKitDancingSquare(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultDancingSquareLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.doubleBounce:
        lc = SpinKitDoubleBounce(
            color: c,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            controller: cm.animationController,
            duration: widget.duration ?? const Duration(seconds: 2));
        break;
      case LoaderType.dualRing:
        lc = SpinKitDualRing(
            color: c,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            lineWidth: widget.breadth ?? (measurements.medium / 2),
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.fadingCircle:
        lc = SpinKitFadingCircle(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.fadingCube:
        lc = SpinKitFadingCube(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 2, milliseconds: 400));
        break;
      case LoaderType.fadingFour:
        lc = SpinKitFadingFour(
            color: c,
            itemBuilder: widget.itemBuilder,
            shape: widget.shape ?? BoxShape.circle,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.fadingGrid:
        lc = SpinKitFadingGrid(
            color: c,
            itemBuilder: widget.itemBuilder,
            shape: widget.shape ?? BoxShape.circle,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.foldingCube:
        lc = SpinKitFoldingCube(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 2, milliseconds: 400));
        break;
      case LoaderType.hourGlass:
        lc = SpinKitHourGlass(
            color: c,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.normal:
        lc = StreamBuilder<Progress>(
            stream: cm.progress, builder: loaderBuilder);
        break;
      case LoaderType.pianoWave:
        lc = SpinKitPianoWave(
            color: c,
            itemCount: cm.itemCount,
            itemBuilder: widget.itemBuilder,
            type: widget.type1 ?? SpinKitPianoWaveType.start,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.pouringHourGlass:
        lc = SpinKitPouringHourGlass(
            color: c,
            strokeWidth: widget.breadth,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 2, milliseconds: 400));
        break;
      case LoaderType.pouringHourGlassRefined:
        lc = SpinKitPouringHourGlassRefined(
            color: c,
            strokeWidth: widget.breadth,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 2, milliseconds: 400));
        break;
      case LoaderType.pulse:
        lc = SpinKitPulse(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ?? const Duration(seconds: 1));
        break;
      case LoaderType.pulsingGrid:
        lc = SpinKitPulsingGrid(
            color: c,
            boxShape: widget.shape,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 500));
        break;
      case LoaderType.pumpingHeart:
        lc = SpinKitPumpingHeart(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 2, milliseconds: 400));
        break;
      case LoaderType.ring:
        lc = SpinKitRing(
            color: c,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            lineWidth: widget.breadth ?? (measurements.medium / 2),
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.ripple:
        lc = SpinKitRipple(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 800));
        break;
      case LoaderType.rotatingCircle:
        lc = SpinKitRotatingCircle(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.rotatingPlain:
        lc = SpinKitRotatingPlain(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.spinningCircle:
        lc = SpinKitSpinningCircle(
            color: c,
            itemBuilder: widget.itemBuilder,
            shape: widget.shape ?? BoxShape.circle,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.spinningLines:
        lc = SpinKitSpinningLines(
            color: c,
            itemCount: cm.itemCount,
            duration: widget.duration ?? const Duration(seconds: 3),
            size: widget.altitude ?? measurements.defaultSpinLinesHt,
            lineWidth: widget.breadth ?? measurements.defaultSpinLinesWidth);
        break;
      case LoaderType.squareCircle:
        lc = SpinKitSquareCircle(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ?? const Duration(milliseconds: 500));
        break;
      case LoaderType.threeBounce:
        lc = SpinKitThreeBounce(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 400));
        break;
      case LoaderType.threeInOut:
        lc = SpinKitThreeInOut(
            color: c,
            itemBuilder: widget.itemBuilder,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ?? const Duration(milliseconds: 500));
        break;
      case LoaderType.wanderingCubes:
        lc = SpinKitWanderingCubes(
            color: c,
            itemBuilder: widget.itemBuilder,
            shape: widget.shape ?? BoxShape.rectangle,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 800));
        break;
      case LoaderType.wave:
        lc = SpinKitWave(
            color: c,
            itemCount: cm.itemCount,
            itemBuilder: widget.itemBuilder,
            type: widget.type2 ?? SpinKitWaveType.start,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ??
                const Duration(seconds: 1, milliseconds: 200));
        break;
      case LoaderType.waveSpinner:
        lc = SpinKitWaveSpinner(
            color: c,
            waveColor: widget.waveColor ?? shades.kGrey1,
            trackColor: widget.trackColor ?? shades.kGrey1,
            size: widget.altitude ?? measurements.defaultLoaderHt,
            duration: widget.duration ?? const Duration(seconds: 3));
        break;
      default:
        lc = CircularProgressIndicator.adaptive(
            strokeCap: widget.strokeCap,
            valueColor: AlwaysStoppedAnimation<Color?>(c),
            strokeWidth: widget.breadth ?? measurements.xs3,
            backgroundColor: context.themeMaterial.scaffoldBackgroundColor);
    }
    // return AnimatedOpacity(
    //     opacity: opacity,
    //     duration:
    //         widget.duration ?? const Duration(seconds: 1, milliseconds: 530),
    //     child: Center(
    //         widthFactor: widget.widthFactor,
    //         heightFactor: widget.heightFactor,
    //         child: lc));
    return Center(
        widthFactor: widget.widthFactor,
        heightFactor: widget.heightFactor,
        child: lc);
  }

  @override
  void initState() {
    super.initState();
    cm.assignState(this);
  }
}
