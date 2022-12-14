import 'package:equatable/equatable.dart';

import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

abstract class ProductsState extends Equatable {}

class NoProductsState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ProductsState {
  final bool isLoaded;
  LoadingState({
    this.isLoaded = false,
  });
  @override
  List<Object?> get props => [];
}

class SuccessState extends ProductsState {
  final List<ConcreteProductEntity> listOfProducts;
  SuccessState({
    this.listOfProducts = const [],
  });

  @override
  List<Object?> get props => [listOfProducts];
}
