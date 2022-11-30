import 'package:equatable/equatable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadedCategoriesState extends CategoriesState {
  final List<Category> allCategoriesEntity;
  LoadedCategoriesState({
    this.allCategoriesEntity = const [],
  });
  @override
  List<Object?> get props => [allCategoriesEntity];
}

class CategoriesLoadingState extends CategoriesState {}
