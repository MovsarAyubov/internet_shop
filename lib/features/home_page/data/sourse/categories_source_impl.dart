import 'package:injectable/injectable.dart';

import '../model/all_categories_model.dart';
import 'categories_source.dart';

@LazySingleton(as: LoadingCategoriesSource)
class LoadingCategoriesSourceImpl implements LoadingCategoriesSource {
  const LoadingCategoriesSourceImpl();
  @override
  Future<CategoriesModel> getAllCategories() async {
    return CategoriesModel.fromJson(MyCategories.getCategories());
  }
}
