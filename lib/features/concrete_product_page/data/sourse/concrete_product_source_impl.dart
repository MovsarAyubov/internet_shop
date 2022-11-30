import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:internet_shop/core/api/main_api.dart';
import 'package:internet_shop/features/concrete_product_page/data/model/concrete_product_model.dart';

import '../../../../core/error/exceptions.dart';
import 'concrete_product_source.dart';

@LazySingleton(as: ConcreteProductSource)
class ConcreteProductSourceImpl implements ConcreteProductSource {
  final MainApi mainApi;
  ConcreteProductSourceImpl({
    required this.mainApi,
  });
  @override
  Future<ConcreteProductModel> getConcreteProduct() async {
    final response = await mainApi.client.get(
      Uri.parse("https://api.escuelajs.co/api/v1/products/5"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final concreteProduct = json.decode(response.body);
      return ConcreteProductModel.fromJson(concreteProduct);
    } else {
      throw ServerException();
    }
  }

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}
