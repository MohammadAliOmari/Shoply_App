import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/useecase/cart/cart_usecase.dart';

class LayoutRepo {
  final _cartUsecase = CartUsecase();
  // final _logoutUsecase = LogoutUsecase();

  // Future<Either<String, bool>> logout() async {
  //   return _logoutUsecase.logout();
  // }

  Future<Either<String, int>> getCartCount() async {
    return _cartUsecase.getCartCount();
  }
}
