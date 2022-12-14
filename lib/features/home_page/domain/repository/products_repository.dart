import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';

abstract class ListOfProductsRepository {
  Future<Either<Failure, List<ConcreteProductEntity>>> getListOfProducts(
      {required int page, required int count});
}
