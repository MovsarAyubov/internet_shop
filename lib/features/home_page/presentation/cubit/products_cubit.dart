import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';
import '../../domain/usecase/get_products.dart';
import 'products_state.dart';

@Injectable()
class ProductsCubit extends Cubit<ProductsState> {
  final GetProducts getProducts;

  ProductsCubit(
    this.getProducts,
  ) : super(LoadingState());

  void loadProducts({
    int offset = 0,
    int limit = 10,
    void Function(List<ConcreteProductEntity>)? onSuccessEmit,
  }) async {
    emit(LoadingState());

    final response = await getProducts(page: offset, count: limit);

    response.fold((error) => emit(ErrorState()), (products) {
      emit(SuccessState(
        listOfProducts:
            List<ConcreteProductEntity>.from(SuccessState().listOfProducts)
              ..addAll(products),
      ));
    });
  }
}
