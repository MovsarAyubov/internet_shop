import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../colors.dart';

class MySmoothIndicator extends StatelessWidget {
  final int activeIndex;
  final int itemCount;
  const MySmoothIndicator({
    Key? key,
    required this.activeIndex,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      effect: const SlideEffect(
        activeDotColor: activeIndicatorColor,
        dotColor: passiveIndicatorColor,
        dotHeight: 10,
        dotWidth: 10,
        spacing: 20,
      ),
      activeIndex: activeIndex,
      count: itemCount,
    );
  }
}
