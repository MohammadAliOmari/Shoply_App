import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:shoply_app/features/favorite/view/widgets/shimmer_favorite_grid.dart';
import 'package:shoply_app/features/trending_product/view_model/cubit.dart';
import 'package:shoply_app/features/trending_product/view_model/state.dart';
part 'widgets/trending_product_card.dart';

class TrendingProductScreen extends StatelessWidget {
  const TrendingProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingProductCubit()..getTrendingProducts(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Trending Product'),
        body: BlocBuilder<TrendingProductCubit, TrendingProductState>(
          builder: (context, state) {
            final cubit = context.read<TrendingProductCubit>();
            if (state is TrendingProductLoadingState) {
              return FavoriteShimmerGrid();
            } else if (state is TrendingProductErrorState) {
              return Center(child: Text(state.errorMessage));
            }
            return CustomRefreshIndicator(
              onRefresh: () async {
                await cubit.refreshData();
              },
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 30,
                ),
                itemCount: cubit.products.length,
                itemBuilder: (context, index) {
                  final ResponseProducts productsData = cubit.products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppPages.productDetailsScreen,
                        arguments: {
                          'responseProducts': productsData,
                          'context': context,
                        },
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
