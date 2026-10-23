abstract class FavoriteState {}

class FavoriteInitState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteErrorState extends FavoriteState {
  final String errorMessage;

  FavoriteErrorState({required this.errorMessage});
}

class FavoriteSucessState extends FavoriteState {}

class FavoriteRemoveSucessState extends FavoriteState {}

class FavoriteAddToCartLoadingState extends FavoriteState {}

class FavoriteAddToCartErrorState extends FavoriteState {
  final String errorMessage;

  FavoriteAddToCartErrorState({required this.errorMessage});
}

class FavoriteAddToCartSuccessState extends FavoriteState {}
