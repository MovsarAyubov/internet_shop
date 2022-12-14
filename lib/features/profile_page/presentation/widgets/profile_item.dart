import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';

class ProfileItem extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  const ProfileItem({
    Key? key,
    required this.callback,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RobotoText(
                  title,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: blackText,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: activeIndicatorColor,
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
