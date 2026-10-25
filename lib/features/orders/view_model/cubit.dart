import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/order/response_order.dart';
import 'package:shoply_app/features/orders/repo/order_repo.dart';
import 'package:shoply_app/features/orders/view_model/state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitState());
  final _orderRepo = OrderRepo();
  List<OrderResponse> ordersList = [];

  Future<void> getOrders() async {
    emit(OrderLoadingState());

    var result = await _orderRepo.getOrders();

    result.fold(
      (failure) {
        emit(OrderErrorState(errorMessage: failure));
      },
      (orderResponse) {
        ordersList.addAll(orderResponse);
        emit(OrderSuccessState());
      },
    );
  }

  Future<void> refreshOrders() async {
    ordersList.clear();
    await getOrders();
  }
}
