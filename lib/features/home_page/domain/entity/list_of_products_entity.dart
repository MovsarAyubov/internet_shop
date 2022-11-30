import 'package:equatable/equatable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';

class ListOfProductsEndtity extends Equatable {
  final List<ConcreteProductEntity> listOfProduct;

  const ListOfProductsEndtity(this.listOfProduct);

  @override
  List<Object?> get props => [listOfProduct];
}
