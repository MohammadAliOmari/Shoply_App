import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogOutUseCase {
  Future<Either<String, bool>> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
