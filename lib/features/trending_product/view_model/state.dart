abstract class TrendingProductState {}

class TrendingProductInitState extends TrendingProductState {}

class TrendingProductLoadingState extends TrendingProductState {}

class TrendingProductErrorState extends TrendingProductState {
  final String errorMessage;

  TrendingProductErrorState({required this.errorMessage});
}

class TrendingProductSuccessState extends TrendingProductState {}
