import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final Color? color;
  final EdgeInsets? padding;
  final Widget child;
  const Bar({Key? key, this.color, this.padding, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).primaryColor,
      padding: padding,
      width: double.infinity,
      child: child,
    );
  }
}
