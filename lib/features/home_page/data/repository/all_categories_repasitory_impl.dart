import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repository/categories_repository.dart';
import '../sourse/categories_source.dart';

@LazySingleton(as: AllCategoriesRepository)
class AllCategoriesRepositoryImpl implements AllCategoriesRepository {
  final LoadingCategoriesSource loadingCategoriesSource;
  AllCategoriesRepositoryImpl({
    required this.loadingCategoriesSource,
  });
  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      final remoteAllCategories =
          await loadingCategoriesSource.getAllCategories();
      return Right(remoteAllCategories.allCategories);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}
