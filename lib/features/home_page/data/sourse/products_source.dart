import 'package:internet_shop/features/home_page/data/model/list_of_products_model.dart';

abstract class LoadingSource {
  Future<ListOfProductsModel> getListOfProducts(
      {required int page, required int count});
}
