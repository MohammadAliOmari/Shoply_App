import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoply_app/core/model/signup/request_signup.dart';

class SignupUsecase {
  Future<Either<String, bool>> signUp({
    required String password,
    required RequestSignup requestSignup,
    required File? profileImage,
  }) async {
    try {
      final snapshot = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            password: password,
            email: requestSignup.email ?? '',
          );
      await _sendEmailVerification(userCredential: snapshot);
      await _saveUserData(
        RequestSignup(
          email: requestSignup.email,
          fullName: requestSignup.fullName,
          userName: requestSignup.userName,
          address: requestSignup.address,
          uid: snapshot.user?.uid,
          profileImage: '',
        ),
      );
      return Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? 'An error occurred during sign up.');
    }
  }

  Future<Either<String, bool>> _saveUserData(
    RequestSignup requestSignup,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(requestSignup.uid)
          .set(requestSignup.toJson());
      // Save user data to Firestore or any other database
      return Right(true);
    } on FirebaseException catch (e) {
      return Left('Failed to save user data: $e');
    }
  }

  Future<Either<String, bool>> _sendEmailVerification({
    required UserCredential userCredential,
  }) async {
    try {
      final actionCodeSettings = ActionCodeSettings(
        iOSBundleId: 'com.example.shoply_app',
        androidPackageName: 'com.example.shoply_app',
        handleCodeInApp: true,
        url:
            'https://shoply-app-510a4.firebaseapp.com/__/auth/action?email=${userCredential.user?.email}',
      );
      await userCredential.user?.sendEmailVerification(actionCodeSettings);
      return Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
