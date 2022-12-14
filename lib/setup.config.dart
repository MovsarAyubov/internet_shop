// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_shop/core/api/main_api.dart' as _i7;
import 'package:internet_shop/features/categories_page/data/datasources/categories_source.dart'
    as _i9;
import 'package:internet_shop/features/categories_page/data/datasources/categories_source_impl.dart'
    as _i10;
import 'package:internet_shop/features/categories_page/data/repositories/categories_repasitory_impl.dart'
    as _i20;
import 'package:internet_shop/features/categories_page/domain/repositories/categories_repository.dart'
    as _i19;
import 'package:internet_shop/features/categories_page/domain/usecases/get_products_by_category.dart'
    as _i25;
import 'package:internet_shop/features/categories_page/presentation/cubit/products_by_category_cubit.dart'
    as _i28;
import 'package:internet_shop/features/concrete_product_page/data/repasitory/concrete_product_repository_impl.dart'
    as _i22;
import 'package:internet_shop/features/concrete_product_page/data/sourse/concrete_product_source.dart'
    as _i11;
import 'package:internet_shop/features/concrete_product_page/data/sourse/concrete_product_source_impl.dart'
    as _i12;
import 'package:internet_shop/features/concrete_product_page/domain/repasitory/concrete_product_repository.dart'
    as _i21;
import 'package:internet_shop/features/concrete_product_page/domain/usecase/get_product.dart'
    as _i24;
import 'package:internet_shop/features/concrete_product_page/presentation/cubit/concrete_product_cubit.dart'
    as _i4;
import 'package:internet_shop/features/delivery_address_page/presentation/cubit/delivery_address_page_cubit.dart'
    as _i5;
import 'package:internet_shop/features/favorites_page/presentation/cubit/favorites_page_cubit.dart'
    as _i6;
import 'package:internet_shop/features/home_page/data/repository/all_categories_repasitory_impl.dart'
    as _i18;
import 'package:internet_shop/features/home_page/data/repository/list_of_product_repasitory.dart'
    as _i27;
import 'package:internet_shop/features/home_page/data/sourse/categories_source.dart'
    as _i13;
import 'package:internet_shop/features/home_page/data/sourse/categories_source_impl.dart'
    as _i14;
import 'package:internet_shop/features/home_page/data/sourse/products_source.dart'
    as _i15;
import 'package:internet_shop/features/home_page/data/sourse/products_source_impl.dart'
    as _i16;
import 'package:internet_shop/features/home_page/domain/repository/categories_repository.dart'
    as _i17;
import 'package:internet_shop/features/home_page/domain/repository/products_repository.dart'
    as _i26;
import 'package:internet_shop/features/home_page/domain/usecase/get_all_categories.dart'
    as _i23;
import 'package:internet_shop/features/home_page/domain/usecase/get_products.dart'
    as _i30;
import 'package:internet_shop/features/home_page/presentation/cubit/categories_cubit.dart'
    as _i29;
import 'package:internet_shop/features/home_page/presentation/cubit/products_cubit.dart'
    as _i31;
import 'package:internet_shop/features/shopping_list/presentation/cubit/shopping_list_cubit.dart'
    as _i8;
import 'package:internet_shop/router/app_router.dart' as _i3;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.factory<_i4.ConcreteProductCubit>(() => _i4.ConcreteProductCubit());
  gh.lazySingleton<_i5.DeliveryAddressPageCubit>(
      () => _i5.DeliveryAddressPageCubit());
  gh.lazySingleton<_i6.FavoritesPageCubit>(() => _i6.FavoritesPageCubit());
  gh.lazySingleton<_i7.MainApi>(() => _i7.MainApi());
  gh.lazySingleton<_i8.ShoppingListCubit>(() => _i8.ShoppingListCubit());
  gh.lazySingleton<_i9.CategorySource>(
      () => _i10.CategorySourceImpl(mainApi: gh<_i7.MainApi>()));
  gh.lazySingleton<_i11.ConcreteProductSource>(
      () => _i12.ConcreteProductSourceImpl(mainApi: gh<_i7.MainApi>()));
  gh.lazySingleton<_i13.LoadingCategoriesSource>(
      () => _i14.LoadingCategoriesSourceImpl(mainApi: gh<_i7.MainApi>()));
  gh.lazySingleton<_i15.LoadingSource>(
      () => _i16.LoadingSourceImpl(gh<_i7.MainApi>()));
  gh.lazySingleton<_i17.AllCategoriesRepository>(() =>
      _i18.AllCategoriesRepositoryImpl(
          loadingCategoriesSource: gh<_i13.LoadingCategoriesSource>()));
  gh.lazySingleton<_i19.CategoriesRepasitory>(() =>
      _i20.CategoriesRepositoryImpl(categorySource: gh<_i9.CategorySource>()));
  gh.lazySingleton<_i21.ConcreteProductRepository>(() =>
      _i22.ConcreteProductRepositoryImpl(
          concreteProductSource: gh<_i11.ConcreteProductSource>()));
  gh.lazySingleton<_i23.GetAllCategories>(() => _i23.GetAllCategories(
      categoryRepository: gh<_i17.AllCategoriesRepository>()));
  gh.lazySingleton<_i24.GetProduct>(() => _i24.GetProduct(
      concreteProductRepository: gh<_i21.ConcreteProductRepository>()));
  gh.lazySingleton<_i25.GetProductsByCategory>(() => _i25.GetProductsByCategory(
      categoriesRepasitory: gh<_i19.CategoriesRepasitory>()));
  gh.lazySingleton<_i26.ListOfProductsRepository>(
      () => _i27.ListOfProductsRepositoryImpl(gh<_i15.LoadingSource>()));
  gh.factory<_i28.ProductsByCategoryCubit>(
      () => _i28.ProductsByCategoryCubit(gh<_i25.GetProductsByCategory>()));
  gh.factory<_i29.CategoriesCubit>(
      () => _i29.CategoriesCubit(gh<_i23.GetAllCategories>()));
  gh.lazySingleton<_i30.GetProducts>(
      () => _i30.GetProducts(gh<_i26.ListOfProductsRepository>()));
  gh.factory<_i31.ProductsCubit>(
      () => _i31.ProductsCubit(gh<_i30.GetProducts>()));
  return getIt;
}
