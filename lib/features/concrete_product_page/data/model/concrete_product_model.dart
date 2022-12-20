import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/product_entity.dart';

part 'concrete_product_model.g.dart';

@JsonSerializable()
class ConcreteProductModel extends ConcreteProductEntity {
  @JsonKey(name: "category")
  final CategoryModel categoryModel;
  const ConcreteProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required this.categoryModel,
    required super.images,
  }) : super(
          category: categoryModel,
        );

  factory ConcreteProductModel.fromJson(Map<String, dynamic> json) =>
      _$ConcreteProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConcreteProductModelToJson(this);
}

@JsonSerializable()
class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
