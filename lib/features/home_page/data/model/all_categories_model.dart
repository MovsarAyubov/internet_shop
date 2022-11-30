import '../../../concrete_product_page/data/model/concrete_product_model.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';
import '../../domain/entity/list_of_categories.dart';

class AllCategoriesModel extends AllCategoriesEntity {
  final List<Category> allCategories;
  AllCategoriesModel(
    this.allCategories,
  ) : super(listOfCategory: MyCategories.getCategories());

  factory AllCategoriesModel.fromJson(List<dynamic> json) {
    List<CategoryModel> categories;
    categories = json.map((item) => CategoryModel.fromJson(item)).toList();

    return AllCategoriesModel(categories);
  }
}

class MyCategories {
  static List<Category> getCategories() {
    return const [
      Category(
          id: 2,
          name: "Fitness Equipment",
          image:
              "https://images.squarespace-cdn.com/content/v1/53b839afe4b07ea978436183/1608506169128-S6KYNEV61LEP5MS1UIH4/traditional-food-around-the-world-Travlinmad.jpg"),
      Category(
          id: 3,
          name: "Furniture",
          image: "https://api.lorem.space/image/furniture?w=640&h=480&r=3094"),
      Category(
          id: 4,
          name: "Shoes",
          image: "https://api.lorem.space/image/shoes?w=640&h=480&r=2301"),
      Category(
          id: 6,
          name: "Hats",
          image:
              "https://media.gq.com/photos/5a04f9a398002d2e253679f5/master/pass/fall-hats-gq-style-0816-01-1.jpg")
    ];
  }
}
