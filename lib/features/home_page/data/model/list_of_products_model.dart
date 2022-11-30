import 'package:json_annotation/json_annotation.dart';

import '../../../concrete_product_page/data/model/concrete_product_model.dart';
import '../../domain/entity/list_of_products_entity.dart';

@JsonSerializable()
class ListOfProductsModel extends ListOfProductsEndtity {
  final List<ConcreteProductModel> listOfProductsModel;
  const ListOfProductsModel(
    this.listOfProductsModel,
  ) : super(listOfProductsModel);

  factory ListOfProductsModel.fromJson(List<dynamic> json) {
    List<ConcreteProductModel> products;
    products = json.map((item) => ConcreteProductModel.fromJson(item)).toList();

    return ListOfProductsModel(products);
  }
}
