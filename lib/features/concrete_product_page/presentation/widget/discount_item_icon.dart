import 'package:flutter/material.dart';

import '../../../../core/components/size_config.dart';

class DiscountItemIcon extends StatelessWidget {
  const DiscountItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.3,
      child: Image.asset(
        "assets/images/50%off.png",
        height: SizeConfig(context, 120)(),
        width: SizeConfig(context, 300)(),
      ),
    );
  }
}
