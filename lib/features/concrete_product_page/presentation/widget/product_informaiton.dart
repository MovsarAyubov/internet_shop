import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';
import 'discounted_price.dart';

class ProductInformation extends StatelessWidget {
  final ConcreteProductEntity product;
  const ProductInformation({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RobotoText(
          product.title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blackText,
          overflow: TextOverflow.clip,
        ),
        const SizedBox(
          height: 10,
        ),
        RobotoText(
          AppLocalizations.of(context)!.description,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: mediumGreyText,
        ),
        const SizedBox(
          height: 5,
        ),
        RobotoText(
          product.description,
          color: blackText,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.clip,
        ),
        const SizedBox(
          height: 15,
        ),
        DiscountedPrice(
          product: product,
        ),
      ],
    );
  }
}
