import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_shop/features/home_page/presentation/cubit/discounted_products_state.dart';

class DiscountedProductsCubit extends HydratedCubit<DiscountedProductsState> {
  DiscountedProductsCubit() : super(const DiscountedProductsState());

  @override
  DiscountedProductsState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(DiscountedProductsState state) {
    throw UnimplementedError();
  }
}
