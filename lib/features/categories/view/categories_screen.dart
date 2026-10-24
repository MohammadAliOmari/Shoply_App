import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/categories/response_categories.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading_data.dart';
import 'package:shoply_app/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:shoply_app/features/categories/view/widgets/shimmer_categories_item.dart';
import 'package:shoply_app/features/categories/view_model/cubit.dart';
import 'package:shoply_app/features/categories/view_model/state.dart';
import 'package:shoply_app/features/home/view/widget/shimmer_categories.dart';
part 'widgets/categories_list_view.dart';
part 'widgets/categories_list_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: Scaffold(
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoadingState) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CategoryItemShimmer();
                  },
                ),
              );
            } else if (state is CategoriesErrorState) {
              return Center(child: Text(state.errorMassege));
            }
            final cubit = context.read<CategoriesCubit>();
            return CustomRefreshIndicator(
              onRefresh: () {
                return cubit.refreshCategories();
              },
              child: _CategoriesListView(cubit: cubit),
            );
          },
        ),
      ),
    );
  }
}
