import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/signup/request_signup.dart';
import 'package:shoply_app/core/useecase/signup/signup_usecase.dart';

class SignupRepo {
  final _signupUseCase = SignupUsecase();
  Future<Either<String, bool>> signUp({
    required String password,
    required RequestSignup requestSignup,
    required File? profileImage,
  }) async {
    return await _signupUseCase.signUp(
      password: password,
      requestSignup: requestSignup,
      profileImage: profileImage,
    );
  }
}
