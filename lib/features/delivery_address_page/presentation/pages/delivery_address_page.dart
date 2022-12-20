import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/core/colors.dart';
import 'package:internet_shop/core/components/roboto_text.dart';
import 'package:internet_shop/core/components/size_config.dart';
import 'package:internet_shop/core/widgets/delivery_adress.dart';
import 'package:internet_shop/features/delivery_address_page/presentation/cubit/delivery_address_page_cubit.dart';
import 'package:internet_shop/validation/validation_type.dart';

import '../../../../core/components/app_bar_with_leading.dart';
import '../../../../setup.dart';
import '../cubit/delivery_address_page_state.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'package:internet_shop/l10n/l10n.dart';

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

  final formKey = GlobalKey<FormState>();

  void clearFields() {
    formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithLeading(appBarHeith: 64),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validationType: LettersAndDash.lettersAndDash,
                      controller: _cityController,
                      title: localizationInstance.city,
                    ),
                    CustomTextField(
                      validationType: LettersAndNumbers.lettersAndNumbers,
                      controller: _streetController,
                      title: localizationInstance.street,
                    ),
                    CustomTextField(
                      validationType: LettersAndNumbers.lettersAndNumbers,
                      controller: _houseController,
                      title: localizationInstance.house,
                    ),
                  ],
                ),
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
                      if (formKey.currentState?.validate() == true) {
                        deliveryAddressCubit.addAddress(
                            streetName: _streetController.text,
                            cityName: _cityController.text,
                            houseNumber: _houseController.text);
                        clearFields();
                      }
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
                          localizationInstance.save,
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
      ),
    );
  }
}
