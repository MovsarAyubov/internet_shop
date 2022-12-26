// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfProductsModel _$ListOfProductsModelFromJson(Map<String, dynamic> json) =>
    ListOfProductsModel(
      (json['listOfProductsModel'] as List<dynamic>)
          .map((e) => ConcreteProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListOfProductsModelToJson(
        ListOfProductsModel instance) =>
    <String, dynamic>{
      'listOfProductsModel': instance.listOfProductsModel,
    };
