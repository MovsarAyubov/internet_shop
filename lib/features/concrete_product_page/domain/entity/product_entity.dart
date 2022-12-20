// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class ConcreteProductEntity extends Equatable {
  final bool discountedProduct;
  final bool addedInShoppingList;
  final bool addedInFavorites;
  final int productCount;
  final int id;
  final String title;
  final num price;
  final String description;
  final List<String> images;
  final Category category;
  const ConcreteProductEntity({
    this.discountedProduct = false,
    this.addedInShoppingList = false,
    this.addedInFavorites = false,
    this.productCount = 1,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });
  @override
  List<Object> get props {
    return [
      discountedProduct,
      addedInShoppingList,
      addedInFavorites,
      productCount,
      id,
      title,
      price,
      description,
      images,
      category,
    ];
  }

  ConcreteProductEntity copyWith({
    bool? discountedProduct,
    bool? addedInShoppingList,
    bool? addedInFavorites,
    int? productCount,
    int? id,
    String? title,
    int? price,
    String? description,
    List<String>? images,
    Category? category,
  }) {
    return ConcreteProductEntity(
      discountedProduct: discountedProduct ?? this.discountedProduct,
      addedInShoppingList: addedInShoppingList ?? this.addedInShoppingList,
      addedInFavorites: addedInFavorites ?? this.addedInFavorites,
      productCount: productCount ?? this.productCount,
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      images: images ?? this.images,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'discountedProduct': discountedProduct});
    result.addAll({'addedInShoppingList': addedInShoppingList});
    result.addAll({'addedInFavorites': addedInFavorites});
    result.addAll({'productCount': productCount});
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'price': price});
    result.addAll({'description': description});
    result.addAll({'images': images});
    result.addAll({'category': category.toMap()});

    return result;
  }

  factory ConcreteProductEntity.fromMap(Map<String, dynamic> map) {
    return ConcreteProductEntity(
      discountedProduct: map['discountedProduct'] ?? false,
      addedInShoppingList: map['addedInShoppingList'] ?? false,
      addedInFavorites: map['addedInFavorites'] ?? false,
      productCount: map['productCount']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      price: map['price']?.toInt() ?? 0,
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      category: Category.fromMap(map['category']),
    );
  }

  @override
  String toString() {
    return 'ConcreteProductEntity(discountedProduct: $discountedProduct, addedInShoppingList: $addedInShoppingList, addedInFavorites: $addedInFavorites, productCount: $productCount, id: $id, title: $title, price: $price, description: $description, images: $images, category: $category)';
  }
}

class Category extends Equatable {
  final int id;
  final String name;
  final String image;
  const Category({
    required this.id,
    required this.name,
    required this.image,
  });

  Category copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      image: (map["image"] ?? '') as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, image];
}
