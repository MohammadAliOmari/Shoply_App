import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoply_app/core/local/local_storge_user.dart';
import 'package:shoply_app/core/model/order/response_order.dart';

class OrderUsecase {
  Future<Either<String, List<OrderResponse>>> getOrders() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('Order')
          .where('userUid', isEqualTo: LocalStorageUser.instance.uid)
          .get();

      return Right(
        response.docs
            .map((order) => OrderResponse.fromJson(order.data()))
            .toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
