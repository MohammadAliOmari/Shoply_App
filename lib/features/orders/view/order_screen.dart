import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/features/orders/view/widgets/order_list.dart';
import 'package:shoply_app/features/orders/view_model/cubit.dart';
import 'package:shoply_app/features/orders/view_model/state.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..getOrders(),
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: CustomAppBar(titleText: 'My Orders'),
          body: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              final cubit = context.read<OrderCubit>();
              if (state is OrderLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is OrderErrorState) {
                return Center(child: Text(state.errorMessage));
              }
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TabBar(
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.all(3),
                      labelPadding: EdgeInsets.zero,
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      indicator: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.white,
                      tabs: const [
                        Tab(text: 'All'),
                        Tab(text: 'Pending'),
                        Tab(text: 'Shiped'),
                        Tab(text: 'Delivered'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        OrderList(cubit: cubit),
                        cubit.ordersList
                                .where((order) => order.status == 'pending')
                                .isEmpty
                            ? Center(child: Text('No Orders Yet'))
                            : OrderList(cubit: cubit),
                        cubit.ordersList
                                .where((order) => order.status == 'shipped')
                                .isEmpty
                            ? Center(child: Text('No Orders Yet'))
                            : OrderList(cubit: cubit),
                        cubit.ordersList
                                .where((order) => order.status == 'delivered')
                                .isEmpty
                            ? Center(child: Text('No Orders Yet'))
                            : OrderList(cubit: cubit),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
