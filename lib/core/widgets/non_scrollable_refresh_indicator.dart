import 'package:flutter/material.dart';

// NOTE: this is really important, it will make overscroll look the same on both platforms
class _CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();
}

class NonScrollableRefreshIndicator extends StatelessWidget {
  final Widget child;
  final double displacement;
  final Future<void> Function() onRefresh;

  const NonScrollableRefreshIndicator({
    required this.child,
    this.displacement = 40.0,
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((_, constraints) {
        return RefreshIndicator(
          displacement: displacement,
          onRefresh: onRefresh,
          child: ScrollConfiguration(
            // Customize scroll behavior for both platforms
            behavior: _CustomScrollBehavior(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    maxHeight: constraints.maxHeight),
                child: child,
              ),
            ),
          ),
        );
      }),
    );
  }
}
