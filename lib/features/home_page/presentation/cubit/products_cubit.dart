import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';
import '../../domain/usecase/get_products.dart';
import 'products_state.dart';

@LazySingleton()
class ProductsCubit extends Cubit<ProductsState> {
  final GetProducts getProducts;
  ProductsCubit(
    this.getProducts,
  ) : super(LoadingState());

  int offset = 0;
  int limit = 10;
  bool isLastChunk = false;
  bool isLoading = false;
  List<ConcreteProductEntity> oldPosts = [];

  Future<void> loadProducts() async {
    if (!isLastChunk && isLoading == false) {
      isLoading = true;
      offset == 0 ? emit(LoadingState()) : null;
      final response = await getProducts(page: offset, count: limit);

      response.fold((error) => emit(ErrorState()), (products) {
        emit(SuccessState(
          listOfProducts: List<ConcreteProductEntity>.from(oldPosts)
            ..addAll(products),
        ));
        oldPosts.addAll(products);
        isLastChunk = products.length < limit;
      });
      offset = offset + limit;
      isLoading = false;
    }
  }
}
