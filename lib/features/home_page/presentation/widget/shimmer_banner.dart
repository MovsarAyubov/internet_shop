import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/size_config.dart';

class ShimmerBanner extends StatelessWidget {
  const ShimmerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Container(
        height: SizeConfig(context, 144)(),
        width: SizeConfig(context, 300)(),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
