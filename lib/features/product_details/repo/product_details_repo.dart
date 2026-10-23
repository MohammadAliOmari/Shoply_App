import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/cart/cart.dart';
import 'package:shoply_app/core/model/products/request_products.dart';
import 'package:shoply_app/core/useecase/cart/cart_usecase.dart';
import 'package:shoply_app/core/useecase/favorite/favorite_usecase.dart';

class ProductDetailsRepo {
  final _cartUsecase = CartUsecase();
  final _favoriteUsecase = FavoriteUsecase();
  Future<Either<String, bool>> addToCart({required Cart requestCart}) async {
    return await _cartUsecase.addToCart(requestCart: requestCart);
  }

  Future<Either<String, bool>> addToFavourite({
    required RequestProducts requestProducts,
  }) async {
    return await _favoriteUsecase.addToFavorite(
      requestProducts: requestProducts,
    );
  }

  Future<Either<String, bool>> removeToFavourite({
    required String productId,
  }) async {
    return await _favoriteUsecase.removeFavorite(productId: productId);
  }

  Future<Either<String, bool>> checkIfProductInFavourite({
    required String productId,
  }) async {
    return await _favoriteUsecase.checkFavorite(productId: productId);
  }
}
