import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/login/request_login.dart';
import 'package:shoply_app/core/model/login/response_login.dart';
import 'package:shoply_app/core/useecase/login/login_usecase.dart';

class LoginRepo {
  final _loginuseCase = LoginUsecase();
  Future<Either<String, ResponseLogin>> login({
    required RequestLogin requestLogin,
  }) async {
    return await _loginuseCase.login(requestLogin: requestLogin);
  }
}
