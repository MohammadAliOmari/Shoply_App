import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/useecase/forgot_password/forgot_password_usecase.dart';

class ForgetPasswordRepo {
  final ForgotPasswordUsecase forgotPasswordUsecase = ForgotPasswordUsecase();
  Future<Either<String, bool>> forgotPassword({required String email}) async {
    return await forgotPasswordUsecase.forgotPassword(email: email);
  }
}
