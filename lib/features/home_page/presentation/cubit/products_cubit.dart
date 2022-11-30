import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:internet_shop/features/home_page/domain/usecase/get_products.dart';
import 'package:internet_shop/features/home_page/presentation/cubit/products_state.dart';

@Injectable()
class ProductsCubit extends Cubit<ProductsState> {
  final GetProducts getProducts;
  ProductsCubit(
    this.getProducts,
  ) : super(LoadingState());

  loadProducts({required int page, required int count}) async {
    final response = await getProducts(page: page, count: count);

    response.fold((error) => emit(ErrorState()), (result) {
      final uploaded = emit(SuccessState(
        listOfProductsEndtity: result,
      ));
    });
  }
}
