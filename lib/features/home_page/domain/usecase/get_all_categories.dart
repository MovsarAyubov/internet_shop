import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';
import '../repository/categories_repository.dart';

@LazySingleton()
class GetAllCategories {
  final AllCategoriesRepository categoryRepository;
  GetAllCategories({
    required this.categoryRepository,
  });

  Future<Either<Failure, List<Category>>> call() async {
    return await categoryRepository.getAllCategories();
  }
}
