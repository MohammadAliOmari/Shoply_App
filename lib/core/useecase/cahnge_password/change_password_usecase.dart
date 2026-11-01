import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordUseCase {
  Future<Either<String, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return left('You are not logged in.');
    }

    final email = currentUser.email;

    if (email == null || email.isEmpty) {
      return left('Password changes require an email/password account.');
    }

    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      );

      await currentUser.reauthenticateWithCredential(credential);

      await currentUser.updatePassword(newPassword);
      return right(true);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? "Error updating password");
    }
  }
}
