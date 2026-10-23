import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/local/local_storge_user.dart';
import 'package:shoply_app/core/model/products/request_products.dart';
import 'package:shoply_app/core/model/products/response_products.dart';

class FavoriteUsecase {
  Future<Either<String, bool>> addToFavorite({
    required RequestProducts requestProducts,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(LocalStorageUser.instance.uid)
          .collection('favorite')
          .doc(requestProducts.id)
          .set(requestProducts.toJson());
      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<Either<String, bool>> removeFavorite({
    required String productId,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(LocalStorageUser.instance.uid)
          .collection('favorite')
          .doc(productId)
          .delete();
      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<Either<String, bool>> checkFavorite({
    required String productId,
  }) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(LocalStorageUser.instance.uid)
          .collection('favorite')
          .doc(productId)
          .get();
      return Right(result.exists);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<Either<String, List<ResponseProducts>>> getFavorite() async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(LocalStorageUser.instance.uid)
          .collection('favorite')
          .get();
      final List<ResponseProducts> responseProducts = [];

      for (var product in result.docs) {
        responseProducts.add(ResponseProducts.fromJson(product.data()));
      }
      return Right(responseProducts);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }

  Future<Either<String, int>> getFavoriteCount() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(LocalStorageUser.instance.uid)
          .collection('favorite')
          .get();

      return Right(snapshot.docs.length);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
