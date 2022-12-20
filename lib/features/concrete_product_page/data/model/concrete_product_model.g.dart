// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concrete_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConcreteProductModel _$ConcreteProductModelFromJson(
        Map<String, dynamic> json) =>
    ConcreteProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as num,
      description: json['description'] as String,
      categoryModel:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ConcreteProductModelToJson(
        ConcreteProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'category': instance.categoryModel,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
