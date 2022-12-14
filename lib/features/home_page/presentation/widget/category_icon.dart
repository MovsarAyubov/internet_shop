import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String imageAsset;
  const CategoryIcon({
    Key? key,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAsset,
      fit: BoxFit.contain,
    );
  }
}
