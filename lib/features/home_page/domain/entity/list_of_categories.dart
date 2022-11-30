import 'package:equatable/equatable.dart';

import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';

class AllCategoriesEntity extends Equatable {
  final List<Category> listOfCategory;
  const AllCategoriesEntity({
    required this.listOfCategory,
  });

  @override
  List<Object?> get props => [];
}
