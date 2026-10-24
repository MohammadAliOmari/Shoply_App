import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/features/orders/view_model/cubit.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.cubit});

  final OrderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: CustomCachedImageNetwork(
                          image: cubit.ordersList[index].cart![0].images![0],
                          height: 100,
                          width: 90,
                        ),
                      ),
                      if (cubit.ordersList[index].cart!.length > 1)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.primaryColor,
                            child: Text(
                              '${cubit.ordersList[index].cart!.length}',
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Order #${cubit.ordersList[index].id!.substring(0, 5)} ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${cubit.ordersList[index].cart!.length} items',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$${cubit.ordersList[index].subTotal!.toStringAsFixed(2)} ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.orange.shade100,
                      border: Border.all(color: Colors.orange, width: 1),
                    ),
                    child: Text(
                      cubit.ordersList[index].status ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(width: 2, color: AppColors.primaryColor),
                ),
                onPressed: () {},
                child: Text(
                  'View Order Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16);
      },
      itemCount: cubit.ordersList.length,
    );
  }
}
