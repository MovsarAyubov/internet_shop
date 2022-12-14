import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/core/cubits/smooth_indicator_state.dart';

class SmoothIndicatorCubit extends Cubit<SmoothIndicatorState> {
  SmoothIndicatorCubit() : super(SmoothIndicatorState());

  void changeCategoryIndicatorState({required int indicatorIndex}) {
    emit(SmoothIndicatorState(categoryIndicatorIndex: indicatorIndex));
  }

  void changeProuctIndicatorState({required int indicatorIndex}) {
    emit(SmoothIndicatorState(productIndicatorIndex: indicatorIndex));
  }

  void getImageIndex({required int indicatorIndex}) {
    emit(SmoothIndicatorState(productImageIndex: indicatorIndex));
  }

  void changeDiscountedProductsIndicator(int indicatorIndex) {
    emit(
        SmoothIndicatorState(discountedProductsIndicatorIndex: indicatorIndex));
  }
}
