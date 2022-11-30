import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/roboto_text.dart';
import '../../../../core/components/size_config.dart';
import 'shimmer_banner.dart';

class CategoryBanner extends StatelessWidget {
  final String categoryName;
  final String imageUrl;
  const CategoryBanner(
      {Key? key, required this.categoryName, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 2,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image(
                image: imageProvider,
                fit: BoxFit.fill,
                height: SizeConfig(context, 144)(),
                width: SizeConfig(context, 300)(),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const ShimmerBanner();
                },
              ),
            ),
            placeholder: (context, url) => const ShimmerBanner(),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: RobotoText(
              categoryName,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
