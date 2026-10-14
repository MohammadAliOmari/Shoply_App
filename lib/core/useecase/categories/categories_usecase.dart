import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/categories/response_categories.dart';

class CategoriesUsecase {
  Future<Either<String, List<ResponseCategories>>> getCategories() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('categories')
          .get();

      final List<ResponseCategories> categoriesData = [];

      for (var category in snapshot.docs) {
        categoriesData.add(ResponseCategories.fromJson(category.data()));
      }
      return Right(categoriesData);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
