import 'package:flutter/material.dart';

class RetryButton extends StatelessWidget {
  final VoidCallback? onRetry;
  final double? size;
  final Color? color;
  const RetryButton({Key? key, this.color, this.onRetry, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onRetry,
      icon: Icon(
        Icons.refresh,
        size: size,
        color: color,
      ),
    );
  }
}
