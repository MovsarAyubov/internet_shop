import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:internet_shop/core/api/main_api.dart';
import 'package:internet_shop/features/home_page/data/model/all_categories_model.dart';
import 'package:internet_shop/features/home_page/data/sourse/categories_source.dart';

import '../../../../core/error/exceptions.dart';

@LazySingleton(as: LoadingCategoriesSource)
class LoadingCategoriesSourceImpl implements LoadingCategoriesSource {
  final MainApi mainApi;
  LoadingCategoriesSourceImpl({
    required this.mainApi,
  });
  @override
  Future<CategoriesModel> getAllCategories() async {
    final response = await mainApi.client.get(
      Uri.parse("https://api.escuelajs.co/api/v1/categories"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final allCategories = json.decode(response.body);
      return CategoriesModel.fromJson(allCategories);
    } else {
      throw ServerException();
    }
  }
}
