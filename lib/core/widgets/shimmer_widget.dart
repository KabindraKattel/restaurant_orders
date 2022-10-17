import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final EdgeInsets margin;

  const ShimmerWidget.rectangular(
      {Key? key,
      this.width = double.infinity,
      required this.height,
      this.margin = EdgeInsets.zero,
      this.shapeBorder = const RoundedRectangleBorder()})
      : super(key: key);

  const ShimmerWidget.circular(
      {Key? key,
      this.width = double.infinity,
      required this.height,
      this.margin = EdgeInsets.zero,
      this.shapeBorder = const CircleBorder()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: Colors.grey,
        ),
      ),
    );
  }
}
