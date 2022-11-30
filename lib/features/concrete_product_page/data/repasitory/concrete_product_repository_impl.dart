import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:internet_shop/core/error/failure.dart';
import 'package:internet_shop/features/concrete_product_page/data/sourse/concrete_product_source.dart';
import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';
import 'package:internet_shop/features/concrete_product_page/domain/repasitory/concrete_product_repository.dart';

@LazySingleton(as: ConcreteProductRepository)
class ConcreteProductRepositoryImpl implements ConcreteProductRepository {
  final ConcreteProductSource concreteProductSource;
  ConcreteProductRepositoryImpl({
    required this.concreteProductSource,
  });
  @override
  Future<Either<Failure, ConcreteProductEntity>> getProduct() async {
    try {
      final result = await concreteProductSource.getConcreteProduct();
      return Right(result);
    } on SocketException {
      return Left(ServerFailure());
    }
  }

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}
