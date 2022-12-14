import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/product_entity.dart';
import 'concrete_product_state.dart';

@Injectable()
class ConcreteProductCubit extends Cubit<ConcreteProductState> {
  ConcreteProductCubit() : super(NoProductState());

  List<ConcreteProductEntity> sortProductsByCategory({
    required List<ConcreteProductEntity> products,
    required ConcreteProductEntity concreteProduct,
  }) {
    final sortedProducts = <ConcreteProductEntity>[];
    sortedProducts.addAll(products.where((element) =>
        element.category == concreteProduct.category &&
        element.title != concreteProduct.title));
    return sortedProducts;
  }
}
