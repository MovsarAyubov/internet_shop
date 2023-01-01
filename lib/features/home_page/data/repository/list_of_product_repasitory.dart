import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';
import '../../domain/repository/products_repository.dart';
import '../sourse/products_source.dart';

@LazySingleton(as: ListOfProductsRepository)
class ListOfProductsRepositoryImpl implements ListOfProductsRepository {
  final LoadingSource loadingSource;
  const ListOfProductsRepositoryImpl(
    this.loadingSource,
  );

  @override
  Future<Either<Failure, List<ConcreteProductEntity>>> getListOfProducts(
      {required int page, required int count}) async {
    try {
      final remoteListOfProducts =
          await loadingSource.getListOfProducts(page: page, count: count);
      return Right(remoteListOfProducts);
    } catch (e) {
      return const Left(FailureSimulation());
    }
  }
}
