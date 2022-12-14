import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';

abstract class AllCategoriesRepository extends Equatable {
  Future<Either<Failure, List<Category>>> getAllCategories();
}
