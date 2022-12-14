import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:internet_shop/features/delivery_address_page/presentation/cubit/delivery_address_page_cubit.dart';
import 'package:internet_shop/router/app_router.dart';

import '../../features/delivery_address_page/presentation/cubit/delivery_address_page_state.dart';
import '../../setup.dart';
import '../colors.dart';
import '../components/roboto_text.dart';

class DeliveryAdress extends StatefulWidget {
  final bool showEditButton;
  const DeliveryAdress({
    Key? key,
    this.showEditButton = false,
  }) : super(key: key);

  @override
  State<DeliveryAdress> createState() => _DeliveryAdressState();
}

class _DeliveryAdressState extends State<DeliveryAdress> {
  final deliveryAddressCubit = getIt<DeliveryAddressPageCubit>();
  final appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryAddressPageCubit, DeliveryAddressPageState>(
        bloc: deliveryAddressCubit,
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RobotoText(
                      AppLocalizations.of(context)!.deliveryAddress,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: blueText,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RobotoText(
                          AppLocalizations.of(context)!.city,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: blackText,
                        ),
                        RobotoText(
                          state.cityName,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: blackText,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RobotoText(
                          AppLocalizations.of(context)!.street,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: blackText,
                        ),
                        RobotoText(
                          state.streetName,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: blackText,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RobotoText(
                          AppLocalizations.of(context)!.house,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: blackText,
                        ),
                        RobotoText(
                          state.house,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: blackText,
                        )
                      ],
                    ),
                    widget.showEditButton
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      appRouter.push(
                                        const DeliveryAddressRoute(),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: blueButton,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          );
        });
  }
}
