import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/profile/request_profile.dart';

class EditProfileUseCase {
  Future<Either<String, bool>> editProfile({
    required String uid,
    required RequestProfile request,
    required File? profileImage,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update(request.toJson());

      return right(true);
    } on FirebaseException catch (e) {
      return left(e.message ?? '');
    }
  }
}
