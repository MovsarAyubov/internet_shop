import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:internet_shop/core/api/main_api.dart';
import 'package:internet_shop/features/home_page/data/model/list_of_products_model.dart';
import 'package:internet_shop/features/home_page/data/sourse/products_source.dart';

import '../../../../core/error/exceptions.dart';

@LazySingleton(as: LoadingSource)
class LoadingSourceImpl implements LoadingSource {
  final MainApi mainApi;
  LoadingSourceImpl(
    this.mainApi,
  );
  @override
  Future<ListOfProductsModel> getListOfProducts(
      {required int page, required int count}) async {
    final response = await mainApi.client.get(
      Uri.parse(
          "https://api.escuelajs.co/api/v1/products?offset=$page&limit=$count"),
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
