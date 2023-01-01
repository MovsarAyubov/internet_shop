import 'package:internet_shop/features/concrete_product_page/data/model/concrete_product_model.dart';

abstract class LoadingSource {
  Future<List<ConcreteProductModel>> getListOfProducts(
      {required int page, required int count});
}
