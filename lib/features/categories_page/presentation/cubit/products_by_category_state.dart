part of 'products_by_category_cubit.dart';

abstract class ProductsByCategoryState extends Equatable {
  const ProductsByCategoryState();

  @override
  List<Object> get props => [];
}

class ProductsLoadedState extends ProductsByCategoryState {
  final List<ConcreteProductEntity> productsByCategory;
  const ProductsLoadedState({
    this.productsByCategory = const [],
  });
  @override
  List<Object> get props => [productsByCategory];

  ProductsLoadedState copyWith({
    List<ConcreteProductEntity>? productsByCategory,
  }) {
    return ProductsLoadedState(
      productsByCategory: productsByCategory ?? this.productsByCategory,
    );
  }
}

class LoadingProductsState extends ProductsByCategoryState {}

class LoadingErrorState extends ProductsByCategoryState {}
