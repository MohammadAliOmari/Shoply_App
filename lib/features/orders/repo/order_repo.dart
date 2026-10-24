import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/order/response_order.dart';
import 'package:shoply_app/core/useecase/order/order_usecase.dart';

class OrderRepo {
  final _orderUsecase = OrderUsecase();

  Future<Either<String, List<OrderResponse>>> getOrders() async {
    return await _orderUsecase.getOrders();
  }
}
