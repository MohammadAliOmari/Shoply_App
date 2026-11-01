abstract class ChangePasswordState {}

class ChangePasswordInitStatee extends ChangePasswordState {}

class ChangePasswordLoadingStatee extends ChangePasswordState {}

class ChangePasswordErrorStatee extends ChangePasswordState {
  final String error;

  ChangePasswordErrorStatee({required this.error});
}

class ChangePasSuccessdInitStatee extends ChangePasswordState {
  final String sucssesmessage;

  ChangePasSuccessdInitStatee({required this.sucssesmessage});
}
