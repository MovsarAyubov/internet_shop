import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';
import 'package:internet_shop/features/concrete_product_page/domain/repasitory/concrete_product_repository.dart';

import '../../../../core/error/failure.dart';

@LazySingleton()
class GetProduct {
  final ConcreteProductRepository concreteProductRepository;
  const GetProduct({
    required this.concreteProductRepository,
  });

  Future<Either<Failure, ConcreteProductEntity>> call() async {
    return await concreteProductRepository.getProduct();
  }
}
