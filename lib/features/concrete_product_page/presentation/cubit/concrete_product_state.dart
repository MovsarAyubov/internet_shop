import 'package:equatable/equatable.dart';

import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

abstract class ConcreteProductState extends Equatable {}

class NoProductState extends ConcreteProductState {
  @override
  List<Object?> get props => [];
}

class ErrorProductState extends ConcreteProductState {
  @override
  List<Object?> get props => [];
}

class LoadingProductState extends ConcreteProductState {
  @override
  List<Object?> get props => [];
}

class SuccessProductState extends ConcreteProductState {
  final ConcreteProductEntity concreteProduct;
  SuccessProductState({
    required this.concreteProduct,
  });

  @override
  List<Object?> get props => [concreteProduct];
}
