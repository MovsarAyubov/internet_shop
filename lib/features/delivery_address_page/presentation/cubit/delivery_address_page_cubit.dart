import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import 'delivery_address_page_state.dart';

@LazySingleton()
class DeliveryAddressPageCubit extends HydratedCubit<DeliveryAddressPageState> {
  DeliveryAddressPageCubit() : super(const DeliveryAddressPageState());

  void addAddress(
      {required String cityName,
      required String streetName,
      required String houseNumber}) {
    emit(DeliveryAddressPageState(
        cityName: cityName, streetName: streetName, house: houseNumber));
  }

  @override
  DeliveryAddressPageState? fromJson(Map<String, dynamic> json) =>
      DeliveryAddressPageState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(DeliveryAddressPageState state) => state.toMap();
}
