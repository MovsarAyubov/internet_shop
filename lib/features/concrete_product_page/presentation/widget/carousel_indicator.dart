import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../core/cubits/smooth_indicator_state.dart';
import '../../../../core/widgets/my_smooth_indicator.dart';

class CarouselIndicator extends StatelessWidget {
  final SmoothIndicatorCubit indicatorCubit;
  const CarouselIndicator({
    Key? key,
    required this.indicatorCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<SmoothIndicatorCubit, SmoothIndicatorState>(
          bloc: indicatorCubit,
          builder: (context, state) {
            return MySmoothIndicator(
                activeIndex: indicatorCubit.state.productImageIndex,
                itemCount: 3);
          }),
    );
  }
}
