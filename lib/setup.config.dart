// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_shop/core/api/main_api.dart' as _i3;
import 'package:internet_shop/features/concrete_product_page/data/repasitory/concrete_product_repository_impl.dart'
    as _i13;
import 'package:internet_shop/features/concrete_product_page/data/sourse/concrete_product_source.dart'
    as _i4;
import 'package:internet_shop/features/concrete_product_page/data/sourse/concrete_product_source_impl.dart'
    as _i5;
import 'package:internet_shop/features/concrete_product_page/domain/repasitory/concrete_product_repository.dart'
    as _i12;
import 'package:internet_shop/features/concrete_product_page/domain/usecase/get_product.dart'
    as _i15;
import 'package:internet_shop/features/concrete_product_page/presentation/cubit/concrete_product_cubit.dart'
    as _i19;
import 'package:internet_shop/features/home_page/data/repository/all_categories_repasitory_impl.dart'
    as _i11;
import 'package:internet_shop/features/home_page/data/repository/list_of_product_repasitory.dart'
    as _i17;
import 'package:internet_shop/features/home_page/data/sourse/categories_source.dart'
    as _i6;
import 'package:internet_shop/features/home_page/data/sourse/categories_source_impl.dart'
    as _i7;
import 'package:internet_shop/features/home_page/data/sourse/products_source.dart'
    as _i8;
import 'package:internet_shop/features/home_page/data/sourse/products_source_impl.dart'
    as _i9;
import 'package:internet_shop/features/home_page/domain/repository/categories_repository.dart'
    as _i10;
import 'package:internet_shop/features/home_page/domain/repository/list_of_products_repository.dart'
    as _i16;
import 'package:internet_shop/features/home_page/domain/usecase/get_all_categories.dart'
    as _i14;
import 'package:internet_shop/features/home_page/domain/usecase/get_products.dart'
    as _i20;
import 'package:internet_shop/features/home_page/presentation/cubit/categories_cubit.dart'
    as _i18;
import 'package:internet_shop/features/home_page/presentation/cubit/products_cubit.dart'
    as _i21;

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
  gh.lazySingleton<_i3.MainApi>(() => _i3.MainApi());
  gh.lazySingleton<_i4.ConcreteProductSource>(
      () => _i5.ConcreteProductSourceImpl(mainApi: gh<_i3.MainApi>()));
  gh.lazySingleton<_i6.LoadingCategoriesSource>(
      () => _i7.LoadingCategoriesSourceImpl(mainApi: gh<_i3.MainApi>()));
  gh.lazySingleton<_i8.LoadingSource>(
      () => _i9.LoadingSourceImpl(gh<_i3.MainApi>()));
  gh.lazySingleton<_i10.AllCategoriesRepository>(() =>
      _i11.AllCategoriesRepositoryImpl(
          loadingCategoriesSource: gh<_i6.LoadingCategoriesSource>()));
  gh.lazySingleton<_i12.ConcreteProductRepository>(() =>
      _i13.ConcreteProductRepositoryImpl(
          concreteProductSource: gh<_i4.ConcreteProductSource>()));
  gh.lazySingleton<_i14.GetAllCategories>(() => _i14.GetAllCategories(
      categoryRepository: gh<_i10.AllCategoriesRepository>()));
  gh.lazySingleton<_i15.GetProduct>(() => _i15.GetProduct(
      concreteProductRepository: gh<_i12.ConcreteProductRepository>()));
  gh.lazySingleton<_i16.ListOfProductsRepository>(
      () => _i17.ListOfProductsRepositoryImpl(gh<_i8.LoadingSource>()));
  gh.factory<_i18.CategoriesCubit>(
      () => _i18.CategoriesCubit(gh<_i14.GetAllCategories>()));
  gh.factory<_i19.ConcreteProductCubit>(
      () => _i19.ConcreteProductCubit(gh<_i15.GetProduct>()));
  gh.lazySingleton<_i20.GetProducts>(
      () => _i20.GetProducts(gh<_i16.ListOfProductsRepository>()));
  gh.factory<_i21.ProductsCubit>(
      () => _i21.ProductsCubit(gh<_i20.GetProducts>()));
  return getIt;
}
