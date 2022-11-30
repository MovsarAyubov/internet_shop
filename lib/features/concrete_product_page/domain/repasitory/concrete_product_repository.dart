import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

import '../../../../core/error/failure.dart';

abstract class ConcreteProductRepository extends Equatable {
  Future<Either<Failure, ConcreteProductEntity>> getProduct();
}
