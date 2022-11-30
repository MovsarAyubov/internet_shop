import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../entity/list_of_categories.dart';

abstract class AllCategoriesRepository extends Equatable {
  Future<Either<Failure, AllCategoriesEntity>> getAllCategories();
}
