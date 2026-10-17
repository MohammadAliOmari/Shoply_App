import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading_data.dart';
import 'package:shoply_app/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:shoply_app/features/products/view_model/cubit.dart';
import 'package:shoply_app/features/products/view_model/state.dart';
part 'widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    super.key,
    required this.titleText,
    required this.categoryId,
  });
  final String titleText;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(categoryId: categoryId),
      child: Scaffold(
        appBar: CustomAppBar(titleText: titleText),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            final cubit = context.read<ProductsCubit>();
            return CustomRefreshIndicator(
              onRefresh: () {
                return cubit.refreshProducts(categoryId: categoryId);
              },
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 30,
                ),
                itemCount: cubit.responseProducts.length,
                itemBuilder: (context, index) {
                  if (state is ProductsLoadingState) {
                    return CustomLoadingData();
                  } else if (state is ProductsErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  final ResponseProducts productsData =
                      cubit.responseProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppPages.productDetailsScreen,
                        arguments: {'responseProducts': productsData},
                      );
                    },
                    child: _ProductCard(productsData: productsData),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
