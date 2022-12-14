import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';

class DiscountedPrice extends StatelessWidget {
  final ConcreteProductEntity product;
  const DiscountedPrice({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return product.discountedProduct
        ? Column(
            children: [
              Row(
                children: [
                  RobotoText(
                    "${AppLocalizations.of(context)!.oldPrice}:",
                    color: blackText,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  RobotoText(
                    "${product.price}P",
                    color: blackText,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  RobotoText(
                    "${AppLocalizations.of(context)!.newPrice}:",
                    color: blackText,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  RobotoText(
                    "${product.price / 2}P",
                    color: redText,
                  ),
                ],
              ),
            ],
          )
        : Row(
            children: [
              RobotoText(
                "${AppLocalizations.of(context)!.price}:",
                color: blackText,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                width: 5,
              ),
              RobotoText(
                "${product.price}P",
                color: redText,
              ),
            ],
          );
  }
}
