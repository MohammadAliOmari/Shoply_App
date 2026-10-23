import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/cart/cart.dart';
import 'package:shoply_app/core/model/products/request_products.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/useecase/cart/cart_usecase.dart';
import 'package:shoply_app/core/useecase/favorite/favorite_usecase.dart';

class FavoriteRepo {
  final _favoriteUsecase = FavoriteUsecase();
  final _cartUsecase = CartUsecase();

  Future<Either<String, bool>> addToFavorite({
    required RequestProducts requestProducts,
  }) async {
    return await _favoriteUsecase.addToFavorite(
      requestProducts: requestProducts,
    );
  }

  Future<Either<String, bool>> removeFavorite({
    required String productId,
  }) async {
    return await _favoriteUsecase.removeFavorite(productId: productId);
  }

  Future<Either<String, List<ResponseProducts>>> getFavorite() async {
    return await _favoriteUsecase.getFavorite();
  }

  Future<Either<String, bool>> addToCart({required Cart requestCart}) async {
    return await _cartUsecase.addToCart(requestCart: requestCart);
  }
}
