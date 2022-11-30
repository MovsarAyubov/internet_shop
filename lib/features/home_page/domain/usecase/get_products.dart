import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entity/list_of_products_entity.dart';
import '../repository/list_of_products_repository.dart';

@LazySingleton()
class GetProducts {
  final ListOfProductsRepository listOfProductsRepository;
  const GetProducts(
    this.listOfProductsRepository,
  );

  Future<Either<Failure, ListOfProductsEndtity>> call(
      {required int page, required int count}) async {
    return await listOfProductsRepository.getListOfProducts(
        page: page, count: count);
  }
}
