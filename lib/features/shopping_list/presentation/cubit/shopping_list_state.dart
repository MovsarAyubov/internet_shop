import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';

class ShoppingListState extends Equatable {
  final List<ConcreteProductEntity> orders;
  final double orderAmount;
  const ShoppingListState({
    this.orders = const [],
    this.orderAmount = 0,
  });
  @override
  List<Object> get props => [orders, orderAmount];

  ShoppingListState copyWith({
    List<ConcreteProductEntity>? orders,
    double? orderAmount,
  }) {
    return ShoppingListState(
      orders: orders ?? this.orders,
      orderAmount: orderAmount ?? this.orderAmount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'orders': orders.map((x) => x.toMap()).toList()});
    result.addAll({'orderAmount': orderAmount});

    return result;
  }

  factory ShoppingListState.fromMap(Map<String, dynamic> map) {
    return ShoppingListState(
      orders: List<ConcreteProductEntity>.from(
          map['orders']?.map((x) => ConcreteProductEntity.fromMap(x))),
      orderAmount: map['orderAmount']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingListState.fromJson(String source) =>
      ShoppingListState.fromMap(json.decode(source));

  @override
  String toString() =>
      'ShoppingListState(orders: $orders, orderAmount: $orderAmount)';
}
