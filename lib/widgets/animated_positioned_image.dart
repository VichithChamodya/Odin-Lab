import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedImage extends StatelessWidget {
  final double? left, right, top, width, height;
  final String asset;
  final int duration;

  const AnimatedPositionedImage({
    super.key,
    this.left,
    this.right,
    this.top,
    required this.width,
    required this.height,
    required this.asset,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      width: width,
      height: height,
      child: FadeInDown(
        duration: Duration(milliseconds: duration),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(asset)),
          ),
        ),
      ),
    );
  }
}
