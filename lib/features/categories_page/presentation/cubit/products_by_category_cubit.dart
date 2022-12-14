import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

import '../../domain/usecases/get_products_by_category.dart';

part 'products_by_category_state.dart';

@Injectable()
class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  final GetProductsByCategory getProducts;
  ProductsByCategoryCubit(
    this.getProducts,
  ) : super(LoadingProductsState());

  void loadProductsByCategory({required int categoryId}) async {
    final response = await getProducts(categoryId);

    response.fold((error) => emit(LoadingErrorState()), (products) {
      emit(ProductsLoadedState(
        productsByCategory: List<ConcreteProductEntity>.from(
            const ProductsLoadedState().productsByCategory)
          ..addAll(products),
      ));
    });
  }

  void cleanList() {
    emit(const ProductsLoadedState(productsByCategory: []));
    emit(LoadingProductsState());
  }
}
