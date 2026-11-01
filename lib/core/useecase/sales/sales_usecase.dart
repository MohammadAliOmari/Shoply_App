import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/sales/response_sales.dart';

class SalesUsecase {
  Future<Either<String, List<ResponseSales>>> getSales() async {
    try {
      final List<ResponseSales> salesData = [];
      final snapshot = await FirebaseFirestore.instance
          .collection('sales')
          .get();
      for (var element in snapshot.docs) {
        salesData.add(ResponseSales.fromJson(element.data()));
      }
      return Right(salesData);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
