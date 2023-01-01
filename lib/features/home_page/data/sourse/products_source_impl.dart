import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/main_api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../concrete_product_page/data/model/concrete_product_model.dart';
import 'products_source.dart';

@LazySingleton(as: LoadingSource)
class LoadingSourceImpl implements LoadingSource {
  final MainApi mainApi;
  LoadingSourceImpl(
    this.mainApi,
  );
  @override
  Future<List<ConcreteProductModel>> getListOfProducts(
      {required int page, required int count}) async {
    try {
      final response = await mainApi.client().getProducts(page, count);

      return response;
    } catch (e) {
      if (e is DioError) {}

      throw ServerException();
    }
  }
}
