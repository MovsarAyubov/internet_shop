import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/colors.dart';
import '../cubit/smooth_indicator_cubit.dart';
import '../cubit/smooth_indicator_state.dart';

class MySmoothIndicator extends StatelessWidget {
  final SmoothIndicatorCubit indicatorCubit;
  final int itemCount;
  const MySmoothIndicator({
    Key? key,
    required this.indicatorCubit,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmoothIndicatorCubit, SmoothIndicatorState>(
      bloc: indicatorCubit,
      builder: (context, state) {
        return AnimatedSmoothIndicator(
          effect: const SlideEffect(
            activeDotColor: activeIndicatorColor,
            dotColor: passiveIndicatorColor,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 20,
          ),
          activeIndex: indicatorCubit.state.categoryIndicatorIndex,
          count: itemCount,
        );
      },
    );
  }
}
