import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internet_shop/core/colors.dart';
import 'package:internet_shop/core/components/size_config.dart';

import '../../../../core/components/custom_sized_box.dart';
import 'shimmer_banner.dart';

class DiscountedProductBanner extends StatelessWidget {
  final String imageUrl;
  const DiscountedProductBanner({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSizedBox(
      width: 300,
      child: Card(
        color: mediumGrey2,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: FittedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/50%off.png",
                  height: 100,
                  width: 100,
                ),
                CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image(
                            height: SizeConfig(context, 100)(),
                            width: SizeConfig(context, 120)(),
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                    placeholder: (context, url) => const CustomSizedBox(
                        height: 100, width: 120, child: ShimmerBanner()),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/no_image.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
