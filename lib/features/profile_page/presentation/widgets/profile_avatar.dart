import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const CircleAvatar(
        backgroundColor: mediumGrey,
        radius: 80,
        child: Icon(
          Icons.person,
          size: 120,
          color: Colors.white,
        ),
      ),
    );
  }
}
