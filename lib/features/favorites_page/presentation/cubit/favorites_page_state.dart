import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';

class FavoritesPageState extends Equatable {
  final List<ConcreteProductEntity> favoriteProducts;
  const FavoritesPageState({
    this.favoriteProducts = const [],
  });

  @override
  List<Object> get props => [favoriteProducts];

  FavoritesPageState copyWith({
    List<ConcreteProductEntity>? favoriteProducts,
  }) {
    return FavoritesPageState(
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll(
        {'favoriteProducts': favoriteProducts.map((x) => x.toMap()).toList()});

    return result;
  }

  factory FavoritesPageState.fromMap(Map<String, dynamic> map) {
    return FavoritesPageState(
      favoriteProducts: List<ConcreteProductEntity>.from(map['favoriteProducts']
          ?.map((x) => ConcreteProductEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesPageState.fromJson(String source) =>
      FavoritesPageState.fromMap(json.decode(source));

  @override
  String toString() =>
      'FavoritesPageState(favoriteProducts: $favoriteProducts)';
}
