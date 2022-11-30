import 'package:equatable/equatable.dart';

class ConcreteProductEntity extends Equatable {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final Category category;
  const ConcreteProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  @override
  List<Object?> get props => [];
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

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
