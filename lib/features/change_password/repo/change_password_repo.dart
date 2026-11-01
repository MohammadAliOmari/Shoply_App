import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/useecase/cahnge_password/change_password_usecase.dart';

class ChangePasswordRepo {
  final _changePasswordUseCase = ChangePasswordUseCase();

  Future<Either<String, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) {
    return _changePasswordUseCase.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
