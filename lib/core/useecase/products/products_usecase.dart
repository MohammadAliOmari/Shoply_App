import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/products/response_products.dart';

class ProductsUsecase {
  Future<Either<String, List<ResponseProducts>>> getTrendingProducts() async {
    try {
      final List<ResponseProducts> productsData = [];

      final productsSnapshot = await FirebaseFirestore.instance
          .collectionGroup('products')
          .where('isTrending', isEqualTo: true)
          .get();

      for (var product in productsSnapshot.docs) {
        productsData.add(ResponseProducts.fromJson(product.data()));
      }
      log(productsData.length.toString());
      return Right(productsData);
    } on FirebaseException catch (e) {
      log(e.message.toString());

      return left(e.message ?? '');
    }
  }

  Future<Either<String, List<ResponseProducts>>> getProducts({
    required String categoryId,
  }) async {
    try {
      log('Category id : $categoryId');
      final snapshot = await FirebaseFirestore.instance
          .collection('categories')
          .doc(categoryId)
          .collection('products')
          .get();

      log('Category id : $categoryId');
      final List<ResponseProducts> productsData = [];
      for (var product in snapshot.docs) {
        productsData.add(ResponseProducts.fromJson(product.data()));
      }
      log('Category product  : ${productsData.length}');
      return Right(productsData);
    } on FirebaseException catch (e) {
      return left(e.message ?? '');
    }
  }
}
