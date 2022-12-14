import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_shop/features/categories_page/domain/repositories/categories_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';

@LazySingleton()
class GetProductsByCategory {
  final CategoriesRepasitory categoriesRepasitory;
  GetProductsByCategory({
    required this.categoriesRepasitory,
  });
  Future<Either<Failure, List<ConcreteProductEntity>>> call(
      int categoryId) async {
    return await categoriesRepasitory.getProductsByCategory(categoryId);
  }
}
