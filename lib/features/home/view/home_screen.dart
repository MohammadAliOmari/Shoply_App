import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:shoply_app/core/utils/widgets/custom_shimmer_loading.dart';
import 'package:shoply_app/features/home/view/widget/image_carousel.dart';
import 'package:shoply_app/features/home/view/widget/shimmer_categories.dart';
import 'package:shoply_app/features/home/view/widget/shimmer_trending_products.dart';
import 'package:shoply_app/features/home/view_model/cubit.dart';
import 'package:shoply_app/features/home/view_model/state.dart';
import 'package:shoply_app/features/layout/view_model/cubit.dart';
part 'widget/home_categories.dart';
part 'widget/home_trending_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHome(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            if (state is HomeLoadingState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ShimmerLoading(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    CategoriesShimmer(),
                    SizedBox(height: 20),

                    TrendingProductsShimmer(),
                  ],
                ),
              );
            } else if (state is HomeErrorState) {
              return Center(child: Text(state.errorMessage));
            }
            return CustomRefreshIndicator(
              onRefresh: () async {
                await cubit.refreshData();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ImageCarousel(
                        imageUrls: cubit.responseSales
                            .map((e) => e.image!)
                            .toList(),

                        onTap: (i) => debugPrint('Tapped image $i'),
                      ),
                    ),
                    SizedBox(height: 15),

                    _HomeCategories(),
                    SizedBox(height: 20),

                    _HometrendingProducts(cubit: cubit),
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
