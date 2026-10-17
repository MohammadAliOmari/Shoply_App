import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/cart/cart.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_smooth_indicator.dart';
import 'package:shoply_app/features/product_details/view_model/cubit.dart';
import 'package:shoply_app/features/product_details/view_model/state.dart';
part 'widgets/product_details_top.dart';
part 'widgets/product_details_bottom.dart';
part 'widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.responseProducts});
  final ResponseProducts responseProducts;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocListener<ProductDetailsCubit, ProductDetailsState>(
          listener: (context, state) {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ProductDetailsTop(responseProducts: responseProducts),
              SizedBox(height: 35),
              _ProductDetailsBody(responseProducts: responseProducts),
              SizedBox(height: 35),
              _ProductDetailsBottom(responseProducts: responseProducts),
            ],
          ),
        ),
      ),
    );
  }
}
