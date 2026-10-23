import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/cart/cart.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/features/favorite/repo/favorite_repo.dart';
import 'package:shoply_app/features/layout/view_model/cubit.dart';
import 'state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitState());

  final _repo = FavoriteRepo();

  final List<ResponseProducts> favoriteList = [];

  Future<void> refreshFavorite() async {
    favoriteList.clear();
    await getFavorite();
  }

  Future<void> addToCart({
    required Cart requestCart,
    required BuildContext context,
  }) async {
    emit(FavoriteAddToCartLoadingState());
    final result = await _repo.addToCart(requestCart: requestCart);
    result.fold(
      (error) {
        emit(FavoriteAddToCartErrorState(errorMessage: error));
      },
      (r) {
        context.read<LayoutCubit>().getCartCount();
        emit(FavoriteAddToCartSuccessState());
      },
    );
  }

  void removeProductFromFav({
    required String productId,
    required BuildContext context,
  }) {
    favoriteList.removeWhere((product) => product.id == productId);
    context.read<LayoutCubit>().decrementFavCount();
    _removeToFavourite(productId: productId);
    emit(FavoriteRemoveSucessState());
  }

  Future<void> _removeToFavourite({required String productId}) async {
    await _repo.removeFavorite(productId: productId);
  }

  Future<void> getFavorite() async {
    emit(FavoriteLoadingState());
    final result = await _repo.getFavorite();
    result.fold(
      (error) {
        emit(FavoriteErrorState(errorMessage: error));
      },
      (responseProducts) {
        favoriteList.addAll(responseProducts);
        emit(FavoriteSucessState());
      },
    );
  }
}
