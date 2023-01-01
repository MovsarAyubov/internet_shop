import '../../../concrete_product_page/data/model/concrete_product_model.dart';

abstract class CategorySource {
  Future<List<ConcreteProductModel>> getProductsByCategory(int categoriId);
}
