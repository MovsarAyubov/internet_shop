import 'package:flutter/material.dart';
import 'package:internet_shop/l10n/l10n.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';
import '../cubit/shopping_list_state.dart';

class OrderCost extends StatelessWidget {
  final ShoppingListState state;
  const OrderCost({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RobotoText(
                localizationInstance.yourShoppingList,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blueText,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RobotoText(
                    localizationInstance.orderAmount,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: blackText,
                  ),
                  RobotoText(
                    "${state.orderAmount} P",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: blackText,
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: 36,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: blueButton,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: RobotoText(
                      localizationInstance.makeAnOrder,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
