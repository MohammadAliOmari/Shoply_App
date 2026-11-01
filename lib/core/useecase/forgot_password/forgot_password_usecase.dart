import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordUsecase {
  Future<Either<String, bool>> forgotPassword({required String email}) async {
    try {
      final actionCodeSettings = ActionCodeSettings(
        iOSBundleId: 'com.example.shoplyApp',
        androidPackageName: 'com.example.shoply_app',
        handleCodeInApp: true,
        url:
            'https://shoply-app-510a4.firebaseapp.com/__/auth/action?mode=action&oobCode=code',
      );

      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );
      return Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
