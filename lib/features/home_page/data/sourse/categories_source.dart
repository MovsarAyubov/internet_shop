import 'package:internet_shop/features/home_page/data/model/all_categories_model.dart';

abstract class LoadingCategoriesSource {
  Future<AllCategoriesModel> getAllCategories();
}
