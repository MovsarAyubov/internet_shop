import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';
import 'favorites_page_state.dart';

@LazySingleton()
class FavoritesPageCubit extends HydratedCubit<FavoritesPageState> {
  FavoritesPageCubit() : super(const FavoritesPageState());

  bool contains(int productId) {
    final index =
        state.favoriteProducts.indexWhere((element) => element.id == productId);
    return index >= 0;
  }

  void addToFavorites(ConcreteProductEntity product) {
    final products = List<ConcreteProductEntity>.from(state.favoriteProducts)
      ..add(product);
    emit(FavoritesPageState(favoriteProducts: products));
  }

  void deleteFromFavorites(ConcreteProductEntity product) {
    final products = List<ConcreteProductEntity>.from(state.favoriteProducts)
      ..removeWhere((element) => element.id == product.id);

    emit(FavoritesPageState(favoriteProducts: products));
  }

  @override
  FavoritesPageState? fromJson(Map<String, dynamic> json) =>
      FavoritesPageState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(FavoritesPageState state) => state.toMap();
}
