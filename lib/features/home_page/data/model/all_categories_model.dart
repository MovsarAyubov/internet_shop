import '../../../concrete_product_page/data/model/concrete_product_model.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';

class CategoriesModel {
  final List<Category> allCategories;
  CategoriesModel(
    this.allCategories,
  );

  factory CategoriesModel.fromJson(List<dynamic> json) {
    List<CategoryModel> categories;
    categories = json.map((item) => CategoryModel.fromJson(item)).toList();

    return CategoriesModel(categories);
  }
}

class MyCategories {
  static List<Category> getCategories() {
    return const [
      Category(
        id: 1,
        name: "Clothes",
        image: "assets/icons/clothes.png",
      ),
      Category(
        id: 4,
        name: "Shoes",
        image: "assets/icons/shoes.png",
      ),
      Category(
        name: "Furniture",
        id: 3,
        image: "assets/icons/furniture.png",
      ),
      Category(
        id: 2,
        name: "Electronics",
        image: "assets/icons/electronics.png",
      ),
      Category(
        id: 5,
        name: "Others",
        image: "assets/icons/other.png",
      )
    ];
  }
}
