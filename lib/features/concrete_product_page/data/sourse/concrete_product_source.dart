import 'package:equatable/equatable.dart';
import 'package:internet_shop/features/concrete_product_page/data/model/concrete_product_model.dart';

abstract class ConcreteProductSource extends Equatable {
  Future<ConcreteProductModel> getConcreteProduct();
}
