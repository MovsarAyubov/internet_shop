import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../core/components/custom_sized_box.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomSizedBox(
        height: 100,
        width: 100,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
          colors: [],
        ),
      ),
    );
  }
}
