import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:internet_shop/features/concrete_product_page/domain/usecase/get_product.dart';
import 'package:internet_shop/features/concrete_product_page/presentation/cubit/concrete_product_state.dart';

@Injectable()
class ConcreteProductCubit extends Cubit<ConcreteProductState> {
  final GetProduct getProduct;
  ConcreteProductCubit(
    this.getProduct,
  ) : super(NoProductState());

  loadProduct() async {
    emit(LoadingProductState());

    final response = await getProduct();
    response.fold((error) => emit(ErrorProductState()), (result) {
      emit(SuccessProductState(concreteProduct: result));
    });
  }
}
