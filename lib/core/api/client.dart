import 'package:dio/dio.dart';
import 'package:internet_shop/features/concrete_product_page/data/model/concrete_product_model.dart';
import 'package:internet_shop/features/home_page/data/model/list_of_products_model.dart';
import 'package:retrofit/http.dart';

part 'client.g.dart';

@RestApi(baseUrl: "")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/products/")
  Future<List<ConcreteProductModel>> getProducts(
    @Query("offset") int offset,
    @Query("limit") int limit,
  );
}
