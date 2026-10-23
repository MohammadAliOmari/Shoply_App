abstract class ProductDetailsState {}

class ProductDetailsInitState extends ProductDetailsState {}

class ProductDetailsChangeQuantityState extends ProductDetailsState {}

class ProductDetailsAddToCartLoadingState extends ProductDetailsState {}

class ProductDetailsAddToCartErrorState extends ProductDetailsState {
  final String errorMessage;

  ProductDetailsAddToCartErrorState({required this.errorMessage});
}

class ProductDetailsAddToCartSuccessState extends ProductDetailsState {}

class ProductDetailsChangeFavouriteState extends ProductDetailsState {}

class ProductDetailsFavoriteLoadingState extends ProductDetailsState {}

class ProductDetailsFavoriteErrorState extends ProductDetailsState {
  final String errorMessage;

  ProductDetailsFavoriteErrorState({required this.errorMessage});
}

class ProductDetailsFavoriteSuccessState extends ProductDetailsState {}
