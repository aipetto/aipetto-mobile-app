import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as Vector;

import '../utils/constants.dart';
import 'wave_clipper.dart';

class CustomWaveClipperHeader extends StatefulWidget {
  final Size? size;
  final num xOffset;
  final num yOffset;
  final int? duration;

  CustomWaveClipperHeader({
    required this.size,
    required this.xOffset,
    required this.yOffset,
    this.duration,
  });

  @override
  State<StatefulWidget> createState() {
    return _CustomWaveClipperHeaderState();
  }
}

class _CustomWaveClipperHeaderState extends State<CustomWaveClipperHeader>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Offset> animList1 = [];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration ?? 2000));

    animationController?.addListener(() {
      animList1.clear();
      for (int i = -2 - widget.xOffset as int;
          i <= (widget.size?.width.toInt() ?? 0.0) + 2;
          i++) {
        animList1.add(Offset(
            i.toDouble() + widget.xOffset,
            sin(((animationController?.value ?? 0.0) * 360 - i) %
                        360 *
                        Vector.degrees2Radians) *
                    20 +
                50 +
                widget.yOffset));
      }
    });
    animationController?.repeat();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: Container(
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: CurvedAnimation(
            parent: animationController as Animation<double>,
            curve: Curves.easeInOut,
          ),
          builder: (context, child) => ClipPath(
            child: Container(
              width: widget.size?.width,
              height: widget.size?.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kColorPrimary.withOpacity(0.5),
                    kColorPrimary,
                  ],
                ),
              ),
            ),
            clipper: WaveClipper(animationController!.value, animList1),
          ),
        ),
      ),
    );
  }
}
