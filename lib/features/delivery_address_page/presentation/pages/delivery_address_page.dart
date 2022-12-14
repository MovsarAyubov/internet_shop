import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/core/colors.dart';
import 'package:internet_shop/core/components/roboto_text.dart';
import 'package:internet_shop/core/components/size_config.dart';
import 'package:internet_shop/core/widgets/delivery_adress.dart';
import 'package:internet_shop/features/delivery_address_page/presentation/cubit/delivery_address_page_cubit.dart';

import '../../../../core/components/app_bar_with_leading.dart';
import '../../../../setup.dart';
import '../cubit/delivery_address_page_state.dart';
import '../widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({super.key});

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final deliveryAddressCubit = getIt<DeliveryAddressPageCubit>();

  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _houseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithLeading(appBarHeith: 64),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          children: [
            Column(
              children: [
                CustomTextField(
                  controller: _cityController,
                  title: AppLocalizations.of(context)!.city,
                ),
                CustomTextField(
                  controller: _streetController,
                  title: AppLocalizations.of(context)!.street,
                ),
                CustomTextField(
                  controller: _houseController,
                  title: AppLocalizations.of(context)!.house,
                ),
              ],
            ),
            BlocBuilder<DeliveryAddressPageCubit, DeliveryAddressPageState>(
                bloc: deliveryAddressCubit,
                builder: (context, state) {
                  return const DeliveryAdress();
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    deliveryAddressCubit.addAddress(
                        streetName: _streetController.text,
                        cityName: _cityController.text,
                        houseNumber: _houseController.text);

                    _cityController.clear();
                    _houseController.clear();
                    _streetController.clear();
                  },
                  child: Container(
                    height: SizeConfig(context, 40)(),
                    width: SizeConfig(context, 100)(),
                    decoration: const BoxDecoration(
                      color: blueButton,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: RobotoText(
                        AppLocalizations.of(context)!.save,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
