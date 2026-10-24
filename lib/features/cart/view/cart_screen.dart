import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_dialog/pro_dialog.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';

import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_dialog.dart';

import 'package:shoply_app/core/utils/widgets/custom_loading.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading_data.dart';
import 'package:shoply_app/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:shoply_app/features/cart/view/widgets/shimmer_cart.dart';
import 'package:shoply_app/features/cart/view_model/cubit.dart';
import 'package:shoply_app/features/cart/view_model/state.dart';
part 'widgets/cart_checkout.dart';
part 'widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is CartCheckoutLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is CartCheckoutErrorState) {
              Navigator.pop(context);
              CustomDialog.showCustomDialog(
                type: DialogType.error,
                context: context,
                title: 'Checkout',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is CartCheckoutSuccessState) {
              Navigator.pop(context);
              CustomDialog.showCustomDialog(
                type: DialogType.success,
                context: context,
                title: 'Checkout',
                description: 'Checkout Successfully.',
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<CartCubit>();
            if (state is CartLoadingState) {
              return CartShimmerList();
            } else if (state is CartErrorState) {
              return Center(child: Text(state.errorMessage));
            }
            return CustomRefreshIndicator(
              onRefresh: () {
                return cubit.refreshCart();
              },
              child: cubit.responseCart.isNotEmpty
                  ? Stack(children: [_CartCard(), _CartCheckout()])
                  : Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .center,
                        children: [
                          Icon(Icons.shopping_cart_outlined, size: 40),
                          SizedBox(height: 40),
                          Text(
                            'Your Cart Is Empty !!',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
