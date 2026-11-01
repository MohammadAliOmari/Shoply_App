import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/profile/request_profile.dart';
import 'package:shoply_app/core/useecase/edit_profile/edit_profile_usecase.dart';

class EditProfileRepo {
  final _editProfileUseCase = EditProfileUseCase();
  Future<Either<String, bool>> editProfile({
    required String uid,
    required RequestProfile request,
    required File? profileImage,
  }) async {
    return await _editProfileUseCase.editProfile(
      uid: uid,
      request: request,
      profileImage: profileImage,
    );
  }
}
