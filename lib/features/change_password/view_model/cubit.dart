import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/change_password/repo/change_password_repo.dart';
import 'package:shoply_app/features/change_password/view_model/state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitStatee());

  final _changePasswordRepo = ChangePasswordRepo();
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController confirmNewPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> changePassword() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(ChangePasswordLoadingStatee());
      final result = await _changePasswordRepo.changePassword(
        currentPassword: currentPassword.text,
        newPassword: newPassword.text,
      );

      return result.fold(
        (error) {
          emit(ChangePasswordErrorStatee(error: error));
        },
        (result) {
          emit(
            ChangePasSuccessdInitStatee(
              sucssesmessage: 'Password Changed Sucssefly.',
            ),
          );
        },
      );
    }
  }

  @override
  Future<void> close() {
    currentPassword.dispose();
    confirmNewPassword.dispose();
    newPassword.dispose();

    return super.close();
  }
}
