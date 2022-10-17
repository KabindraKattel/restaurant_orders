import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselView extends StatefulWidget {
  final List<Widget> screens;
  const CarouselView({Key? key, required this.screens}) : super(key: key);

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController =
        AnimationController(vsync: this, duration: DurationConstants.kSec1);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screens.isEmpty) {
      return Container();
    }
    var pageView = PageView(
      controller: _pageController,
      children: widget.screens,
    );
    if (widget.screens.length == 1) {
      return pageView;
    }
    var pageIndicator = Positioned.fill(
      child: SmoothPageIndicator(
        controller: _pageController,
        count: widget.screens.length,
        effect: WormEffect(
          dotWidth: SpacingConstants.kS8,
          dotHeight: SpacingConstants.kS8,
          dotColor: ColorConstants.kBlack30,
          activeDotColor: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
      ),
    );
    return Column(
      children: [
        Expanded(
          child: pageView,
        ),
        pageIndicator,
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
