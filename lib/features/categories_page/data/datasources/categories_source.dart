import '../../../home_page/data/model/list_of_products_model.dart';

abstract class CategorySource {
  Future<ListOfProductsModel> getProductsByCategory(int categoriId);
}
