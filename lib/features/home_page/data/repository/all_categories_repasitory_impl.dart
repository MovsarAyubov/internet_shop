import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/list_of_categories.dart';
import '../../domain/repository/categories_repository.dart';
import '../sourse/categories_source.dart';

@LazySingleton(as: AllCategoriesRepository)
class AllCategoriesRepositoryImpl implements AllCategoriesRepository {
  final LoadingCategoriesSource loadingCategoriesSource;
  AllCategoriesRepositoryImpl({
    required this.loadingCategoriesSource,
  });
  @override
  Future<Either<Failure, AllCategoriesEntity>> getAllCategories() async {
    try {
      final remoteAllCategories =
          await loadingCategoriesSource.getAllCategories();
      return Right(remoteAllCategories);
    } on SocketException {
      return Left(ServerFailure());
    }
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}
