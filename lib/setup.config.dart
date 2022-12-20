// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_shop/core/api/main_api.dart' as _i10;
import 'package:internet_shop/features/auth_page/presentation/cubit/account_in_system_cubit.dart'
    as _i3;
import 'package:internet_shop/features/auth_page/presentation/cubit/auth_page_cubit.dart'
    as _i5;
import 'package:internet_shop/features/categories_page/data/datasources/categories_source.dart'
    as _i12;
import 'package:internet_shop/features/categories_page/data/datasources/categories_source_impl.dart'
    as _i13;
import 'package:internet_shop/features/categories_page/data/repositories/categories_repasitory_impl.dart'
    as _i23;
import 'package:internet_shop/features/categories_page/domain/repositories/categories_repository.dart'
    as _i22;
import 'package:internet_shop/features/categories_page/domain/usecases/get_products_by_category.dart'
    as _i28;
import 'package:internet_shop/features/categories_page/presentation/cubit/products_by_category_cubit.dart'
    as _i31;
import 'package:internet_shop/features/concrete_product_page/data/repasitory/concrete_product_repository_impl.dart'
    as _i25;
import 'package:internet_shop/features/concrete_product_page/data/sourse/concrete_product_source.dart'
    as _i14;
import 'package:internet_shop/features/concrete_product_page/data/sourse/concrete_product_source_impl.dart'
    as _i15;
import 'package:internet_shop/features/concrete_product_page/domain/repasitory/concrete_product_repository.dart'
    as _i24;
import 'package:internet_shop/features/concrete_product_page/domain/usecase/get_product.dart'
    as _i27;
import 'package:internet_shop/features/concrete_product_page/presentation/cubit/concrete_product_cubit.dart'
    as _i6;
import 'package:internet_shop/features/delivery_address_page/presentation/cubit/delivery_address_page_cubit.dart'
    as _i7;
import 'package:internet_shop/features/favorites_page/presentation/cubit/favorites_page_cubit.dart'
    as _i8;
import 'package:internet_shop/features/home_page/data/repository/all_categories_repasitory_impl.dart'
    as _i21;
import 'package:internet_shop/features/home_page/data/repository/list_of_product_repasitory.dart'
    as _i30;
import 'package:internet_shop/features/home_page/data/sourse/categories_source.dart'
    as _i16;
import 'package:internet_shop/features/home_page/data/sourse/categories_source_impl.dart'
    as _i17;
import 'package:internet_shop/features/home_page/data/sourse/products_source.dart'
    as _i18;
import 'package:internet_shop/features/home_page/data/sourse/products_source_impl.dart'
    as _i19;
import 'package:internet_shop/features/home_page/domain/repository/categories_repository.dart'
    as _i20;
import 'package:internet_shop/features/home_page/domain/repository/products_repository.dart'
    as _i29;
import 'package:internet_shop/features/home_page/domain/usecase/get_all_categories.dart'
    as _i26;
import 'package:internet_shop/features/home_page/domain/usecase/get_products.dart'
    as _i33;
import 'package:internet_shop/features/home_page/presentation/cubit/categories_cubit.dart'
    as _i32;
import 'package:internet_shop/features/home_page/presentation/cubit/products_cubit.dart'
    as _i34;
import 'package:internet_shop/features/profile_page/presentation/cubit/image_pciker_cubit.dart'
    as _i9;
import 'package:internet_shop/features/shopping_list/presentation/cubit/shopping_list_cubit.dart'
    as _i11;
import 'package:internet_shop/router/app_router.dart' as _i4;

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
  gh.lazySingleton<_i3.AccountInSystemCubit>(() => _i3.AccountInSystemCubit());
  gh.singleton<_i4.AppRouter>(_i4.AppRouter());
  gh.lazySingleton<_i5.AuthPageCubit>(
      () => _i5.AuthPageCubit(gh<_i3.AccountInSystemCubit>()));
  gh.factory<_i6.ConcreteProductCubit>(() => _i6.ConcreteProductCubit());
  gh.lazySingleton<_i7.DeliveryAddressPageCubit>(
      () => _i7.DeliveryAddressPageCubit());
  gh.lazySingleton<_i8.FavoritesPageCubit>(() => _i8.FavoritesPageCubit());
  gh.lazySingleton<_i9.ImagePickerCubit>(() => _i9.ImagePickerCubit());
  gh.lazySingleton<_i10.MainApi>(() => _i10.MainApi());
  gh.lazySingleton<_i11.ShoppingListCubit>(() => _i11.ShoppingListCubit());
  gh.lazySingleton<_i12.CategorySource>(
      () => _i13.CategorySourceImpl(mainApi: gh<_i10.MainApi>()));
  gh.lazySingleton<_i14.ConcreteProductSource>(
      () => _i15.ConcreteProductSourceImpl(mainApi: gh<_i10.MainApi>()));
  gh.lazySingleton<_i16.LoadingCategoriesSource>(
      () => _i17.LoadingCategoriesSourceImpl(mainApi: gh<_i10.MainApi>()));
  gh.lazySingleton<_i18.LoadingSource>(
      () => _i19.LoadingSourceImpl(gh<_i10.MainApi>()));
  gh.lazySingleton<_i20.AllCategoriesRepository>(() =>
      _i21.AllCategoriesRepositoryImpl(
          loadingCategoriesSource: gh<_i16.LoadingCategoriesSource>()));
  gh.lazySingleton<_i22.CategoriesRepasitory>(() =>
      _i23.CategoriesRepositoryImpl(categorySource: gh<_i12.CategorySource>()));
  gh.lazySingleton<_i24.ConcreteProductRepository>(() =>
      _i25.ConcreteProductRepositoryImpl(
          concreteProductSource: gh<_i14.ConcreteProductSource>()));
  gh.lazySingleton<_i26.GetAllCategories>(() => _i26.GetAllCategories(
      categoryRepository: gh<_i20.AllCategoriesRepository>()));
  gh.lazySingleton<_i27.GetProduct>(() => _i27.GetProduct(
      concreteProductRepository: gh<_i24.ConcreteProductRepository>()));
  gh.lazySingleton<_i28.GetProductsByCategory>(() => _i28.GetProductsByCategory(
      categoriesRepasitory: gh<_i22.CategoriesRepasitory>()));
  gh.lazySingleton<_i29.ListOfProductsRepository>(
      () => _i30.ListOfProductsRepositoryImpl(gh<_i18.LoadingSource>()));
  gh.factory<_i31.ProductsByCategoryCubit>(
      () => _i31.ProductsByCategoryCubit(gh<_i28.GetProductsByCategory>()));
  gh.factory<_i32.CategoriesCubit>(
      () => _i32.CategoriesCubit(gh<_i26.GetAllCategories>()));
  gh.lazySingleton<_i33.GetProducts>(
      () => _i33.GetProducts(gh<_i29.ListOfProductsRepository>()));
  gh.lazySingleton<_i34.ProductsCubit>(
      () => _i34.ProductsCubit(gh<_i33.GetProducts>()));
  return getIt;
}
