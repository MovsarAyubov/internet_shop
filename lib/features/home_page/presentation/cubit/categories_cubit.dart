import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/all_categories_model.dart';
import '../../domain/usecase/get_all_categories.dart';
import 'categories_state.dart';

@Injectable()
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetAllCategories getAllCategories;
  CategoriesCubit(
    this.getAllCategories,
  ) : super(LoadedCategoriesState());

  void getCategories() {
    final categories = MyCategories.getCategories();

    emit(LoadedCategoriesState(allCategoriesEntity: categories));
  }
}
