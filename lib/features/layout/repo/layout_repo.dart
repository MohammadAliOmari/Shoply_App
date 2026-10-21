import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/useecase/cart/cart_usecase.dart';
import 'package:shoply_app/core/useecase/logout/logout_usecase.dart';

class LayoutRepo {
  final _cartUsecase = CartUsecase();
  final _logoutUsecase = LogOutUseCase();

  Future<Either<String, bool>> logOut() async {
    return _logoutUsecase.logOut();
  }

  Future<Either<String, int>> getCartCount() async {
    return _cartUsecase.getCartCount();
  }
}
