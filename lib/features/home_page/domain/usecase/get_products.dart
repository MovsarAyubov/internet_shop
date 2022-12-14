import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';
import '../repository/products_repository.dart';

@LazySingleton()
class GetProducts {
  final ListOfProductsRepository listOfProductsRepository;
  const GetProducts(
    this.listOfProductsRepository,
  );

  Future<Either<Failure, List<ConcreteProductEntity>>> call(
      {required int page, required int count}) async {
    return await listOfProductsRepository.getListOfProducts(
        page: page, count: count);
  }
}
