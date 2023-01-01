import 'package:dio/dio.dart';
import 'package:internet_shop/core/api/urls.dart';
import 'package:retrofit/http.dart';

import '../../features/concrete_product_page/data/model/concrete_product_model.dart';

part 'client.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(Urls.products)
  Future<List<ConcreteProductModel>> getProducts(
    @Query("offset") int offset,
    @Query("limit") int limit,
  );

  @GET(Urls.categories)
  Future<List<ConcreteProductModel>> getProductsByCategory(
      @Path("id") int categoryId);
}
