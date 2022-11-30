import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/list_of_products_entity.dart';

abstract class ListOfProductsRepository {
  Future<Either<Failure, ListOfProductsEndtity>> getListOfProducts(
      {required int page, required int count});
}
