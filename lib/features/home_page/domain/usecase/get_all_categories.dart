import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entity/list_of_categories.dart';
import '../repository/categories_repository.dart';

@LazySingleton()
class GetAllCategories {
  final AllCategoriesRepository categoryRepository;
  GetAllCategories({
    required this.categoryRepository,
  });

  Future<Either<Failure, AllCategoriesEntity>> call() async {
    return await categoryRepository.getAllCategories();
  }
}
