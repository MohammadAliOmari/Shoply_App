import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoply_app/core/model/signup/request_signup.dart';
import 'package:shoply_app/features/signup/repo/signup_repo.dart';
import 'package:shoply_app/features/signup/view_model/state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());
  final SignupRepo _signupRepo = SignupRepo();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? profileImage;
  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(SignUpLoadingState());
      final result = await _signupRepo.signUp(
        profileImage: profileImage?.path != null
            ? File(profileImage!.path)
            : null,
        password: passwordController.text,
        requestSignup: RequestSignup(
          email: emailController.text,
          fullName: fullNameController.text,
          userName: userNameController.text,
          address: addressController.text,
        ),
      );
      return result.fold(
        (errorMessage) {
          emit(SignUpErrorState(errorMessage: errorMessage));
        },
        (_) {
          emit(
            SignUpSuccessState(successMessage: 'User Register Successfully'),
          );
        },
      );
    }
  }

  void pickImage() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    profileImage = File(imageFile?.path ?? '');
    emit(SignUpPickImageState());
  }

  void deleteImage() {
    profileImage = null;
    emit(SignUpPickImageState());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    userNameController.dispose();
    addressController.dispose();
    fullNameController.dispose();

    return super.close();
  }
}
