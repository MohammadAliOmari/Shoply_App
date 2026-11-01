abstract class EditProfileState {}

class EditProfileInitialState extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileSuccessState extends EditProfileState {
  final String successMessage;
  EditProfileSuccessState({required this.successMessage});
}

class EditProfileErrorState extends EditProfileState {
  final String errorMessage;
  EditProfileErrorState({required this.errorMessage});
}

class EditProfilePickImageState extends EditProfileState {}
