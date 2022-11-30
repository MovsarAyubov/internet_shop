import 'package:equatable/equatable.dart';

import 'package:internet_shop/features/home_page/domain/entity/list_of_products_entity.dart';

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
  final ListOfProductsEndtity listOfProductsEndtity;
  SuccessState({
    required this.listOfProductsEndtity,
  });

  @override
  List<Object?> get props => [listOfProductsEndtity];
}

class PagesState extends ProductsState {
  final int pages;
  final int itemsInPage;
  PagesState({
    this.pages = 0,
    this.itemsInPage = 10,
  });
  @override
  List<Object?> get props => [];
}
