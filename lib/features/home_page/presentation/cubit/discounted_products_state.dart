import 'package:equatable/equatable.dart';

import '../../../concrete_product_page/domain/entity/product_entity.dart';

class DiscountedProductsState extends Equatable {
  final List<ConcreteProductEntity> discountedProducts;
  const DiscountedProductsState({
    this.discountedProducts = const [
      ConcreteProductEntity(
        discountedProduct: true,
        id: 22,
        title: "Intelligent Frozen Pizza",
        price: 994,
        description:
            "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit",
        images: [
          "https://api.lorem.space/image/shoes?w=640&h=480&r=3669",
          "https://api.lorem.space/image/shoes?w=640&h=480&r=3515",
          "https://api.lorem.space/image/shoes?w=640&h=480&r=6906"
        ],
        category: Category(
            id: 4,
            name: "Shoes",
            image: "https://api.lorem.space/image/shoes?w=640&h=480&r=4383"),
      ),
      ConcreteProductEntity(
          discountedProduct: true,
          id: 186,
          title: "Tasty Wooden Chair",
          price: 564,
          description:
              "Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support",
          images: [
            "https://api.lorem.space/image/furniture?w=640&h=480&r=3712",
            "https://api.lorem.space/image/furniture?w=640&h=480&r=2799",
            "https://api.lorem.space/image/furniture?w=640&h=480&r=7595"
          ],
          category: Category(
              id: 3,
              name: "Furniture",
              image:
                  "https://api.lorem.space/image/furniture?w=640&h=480&r=4786")),
      ConcreteProductEntity(
          discountedProduct: true,
          id: 106,
          title: "Incredible Plastic Soap",
          price: 819,
          description:
              "Boston's most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
          images: [
            "https://api.lorem.space/image/watch?w=640&h=480&r=562",
            "https://api.lorem.space/image/watch?w=640&h=480&r=2118",
            "https://api.lorem.space/image/watch?w=640&h=480&r=6467"
          ],
          category: Category(
              id: 2,
              name: "Electronics",
              image: "https://api.lorem.space/image/watch?w=640&h=480&r=7732")),
      ConcreteProductEntity(
          discountedProduct: true,
          id: 151,
          title: "Licensed Soft Towels",
          price: 308,
          description:
              "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
          images: [
            "https://api.lorem.space/image/fashion?w=640&h=480&r=3540",
            "https://api.lorem.space/image/fashion?w=640&h=480&r=1477",
            "https://api.lorem.space/image/fashion?w=640&h=480&r=1803"
          ],
          category: Category(
              id: 1,
              name: "Clothes",
              image:
                  "https://api.lorem.space/image/fashion?w=640&h=480&r=3268"))
    ],
  });

  @override
  List<Object?> get props => [discountedProducts];
}
