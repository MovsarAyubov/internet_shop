import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_shop/core/error/exceptions.dart';

import 'package:internet_shop/core/error/failure.dart';
import 'package:internet_shop/features/categories_page/data/datasources/categories_source.dart';
import 'package:internet_shop/features/categories_page/domain/repositories/categories_repository.dart';
import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

@LazySingleton(as: CategoriesRepasitory)
class CategoriesRepositoryImpl implements CategoriesRepasitory {
  final CategorySource categorySource;
  CategoriesRepositoryImpl({
    required this.categorySource,
  });
  @override
  Future<Either<Failure, List<ConcreteProductEntity>>> getProductsByCategory(
      int categoryId) async {
    try {
      final remoteListOfProducts =
          await categorySource.getProductsByCategory(categoryId);
      return Right(remoteListOfProducts);
    } on SocketException {
      return const Left(ServerFailure("", 0));
    }
  }

  @override
  List<Object?> get props => [categorySource];

  @override
  bool? get stringify => throw UnimplementedError();
}
