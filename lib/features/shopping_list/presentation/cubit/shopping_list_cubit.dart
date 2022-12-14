import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';
import 'shopping_list_state.dart';

@LazySingleton()
class ShoppingListCubit extends HydratedCubit<ShoppingListState> {
  ShoppingListCubit() : super(const ShoppingListState());

  bool contains(int id) {
    final index = state.orders.indexWhere((element) => element.id == id);
    return index >= 0;
  }

  void addToShoppingList(ConcreteProductEntity product) {
    final products = List<ConcreteProductEntity>.from(state.orders)
      ..add(product.copyWith(addedInShoppingList: true));

    final discountedProduct = product.discountedProduct
        ? state.orderAmount + (product.price / 2)
        : state.orderAmount + product.price;

    emit(
      ShoppingListState(
        orders: products,
        orderAmount: discountedProduct,
      ),
    );
  }

  void cleanShoppingList() {
    emit(const ShoppingListState(orders: [], orderAmount: 0));
  }

  void deleteProductFromShoppingList(ConcreteProductEntity product) {
    final products = List<ConcreteProductEntity>.from(state.orders)
      ..removeWhere((element) => element.id == product.id);
    final cost = product.discountedProduct
        ? state.orderAmount - (product.price * product.productCount / 2)
        : state.orderAmount - (product.price * product.productCount);

    emit(ShoppingListState(
      orders: products,
      orderAmount: cost,
    ));
  }

  void incrementCount(ConcreteProductEntity order) {
    final products =
        List<ConcreteProductEntity>.from(state.orders).map((element) {
      return element.id == order.id
          ? element.copyWith(productCount: element.productCount + 1)
          : element;
    }).toList();

    final discountedProduct = order.discountedProduct
        ? state.orderAmount + (order.price / 2)
        : state.orderAmount + order.price;

    emit(ShoppingListState(orders: products, orderAmount: discountedProduct));
  }

  void decrementCount(ConcreteProductEntity order) {
    final products =
        List<ConcreteProductEntity>.from(state.orders).map((element) {
      if (element.productCount != 1 && element.id == order.id) {
        return element.copyWith(productCount: element.productCount - 1);
      } else {
        return element;
      }
    }).toList();
    if (order.productCount == 1) {
      return;
    }

    final discountedProduct = order.discountedProduct
        ? state.orderAmount - (order.price / 2)
        : state.orderAmount - order.price;

    emit(ShoppingListState(orders: products, orderAmount: discountedProduct));
  }

  @override
  ShoppingListState? fromJson(Map<String, dynamic> json) =>
      ShoppingListState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(ShoppingListState state) => state.toMap();
}
