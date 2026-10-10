abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final String successMessage;

  SignUpSuccessState({required this.successMessage});
}

class SignUpErrorState extends SignUpState {
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});
}
