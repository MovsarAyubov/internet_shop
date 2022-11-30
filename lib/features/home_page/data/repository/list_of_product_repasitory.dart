import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_shop/features/home_page/domain/entity/list_of_products_entity.dart';
import 'package:internet_shop/core/error/failure.dart';

import '../../domain/repository/list_of_products_repository.dart';
import '../sourse/products_source.dart';

@LazySingleton(as: ListOfProductsRepository)
class ListOfProductsRepositoryImpl implements ListOfProductsRepository {
  final LoadingSource loadingSource;
  const ListOfProductsRepositoryImpl(
    this.loadingSource,
  );

  @override
  Future<Either<Failure, ListOfProductsEndtity>> getListOfProducts(
      {required int page, required int count}) async {
    try {
      final remoteListOfProducts =
          await loadingSource.getListOfProducts(page: page, count: count);
      return Right(remoteListOfProducts);
    } on SocketException {
      return Left(ServerFailure());
    }
  }
}
