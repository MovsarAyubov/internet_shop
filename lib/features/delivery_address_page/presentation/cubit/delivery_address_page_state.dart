import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeliveryAddressPageState extends Equatable {
  final String cityName;
  final String streetName;
  final String house;
  const DeliveryAddressPageState({
    this.cityName = "-",
    this.streetName = "-",
    this.house = "-",
  });

  @override
  List<Object> get props => [cityName, streetName, house];

  DeliveryAddressPageState copyWith({
    String? cityName,
    String? streetName,
    String? house,
  }) {
    return DeliveryAddressPageState(
      cityName: cityName ?? this.cityName,
      streetName: streetName ?? this.streetName,
      house: house ?? this.house,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cityName': cityName});
    result.addAll({'streetName': streetName});
    result.addAll({'house': house});

    return result;
  }

  factory DeliveryAddressPageState.fromMap(Map<String, dynamic> map) {
    return DeliveryAddressPageState(
      cityName: map['cityName'] ?? '',
      streetName: map['streetName'] ?? '',
      house: map['house'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryAddressPageState.fromJson(String source) =>
      DeliveryAddressPageState.fromMap(json.decode(source));

  @override
  String toString() =>
      'DeliveryAddressPageState(cityName: $cityName, streetName: $streetName, house: $house)';
}
