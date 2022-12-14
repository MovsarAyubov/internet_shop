part of 'main_page_cubit.dart';

class MainPageState extends Equatable {
  final int pageIndex;
  const MainPageState({this.pageIndex = 0});

  @override
  List<Object> get props => [pageIndex];

  MainPageState copyWith({
    int? pageIndex,
  }) {
    return MainPageState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
