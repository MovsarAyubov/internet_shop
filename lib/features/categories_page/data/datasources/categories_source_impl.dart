import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/api/main_api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../home_page/data/model/list_of_products_model.dart';
import 'categories_source.dart';

@LazySingleton(as: CategorySource)
class CategorySourceImpl implements CategorySource {
  final MainApi mainApi;
  CategorySourceImpl({
    required this.mainApi,
  });
  @override
  Future<ListOfProductsModel> getProductsByCategory(int categoryId) async {
    final response = await mainApi.client.get(
      Uri.parse(
          "https://api.escuelajs.co/api/v1/categories/$categoryId/products"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final listOfProducts = json.decode(response.body);
      return ListOfProductsModel.fromJson(listOfProducts);
    } else {
      throw ServerException();
    }
  }
}
