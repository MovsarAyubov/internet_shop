import 'package:injectable/injectable.dart';

import '../../../../core/api/main_api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../concrete_product_page/data/model/concrete_product_model.dart';
import 'categories_source.dart';

@LazySingleton(as: CategorySource)
class CategorySourceImpl implements CategorySource {
  final MainApi mainApi;
  CategorySourceImpl({
    required this.mainApi,
  });
  @override
  Future<List<ConcreteProductModel>> getProductsByCategory(
      int categoryId) async {
    final response = await mainApi.client().getProductsByCategory(categoryId);
    try {
      return response;
    } catch (e) {
      throw ServerException();
    }
  }
}
