import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_dialog/pro_dialog.dart';
import 'package:shoply_app/core/model/cart/cart.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_dialog.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading_data.dart';
import 'package:shoply_app/core/utils/widgets/custom_refresh_indicator.dart';
import 'package:shoply_app/features/favorite/view_model/cubit.dart';
import 'package:shoply_app/features/favorite/view_model/state.dart';

part 'widgets/favorite_grid.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavorite(),
      child: Scaffold(
        body: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteAddToCartLoadingState) {
              CustomLoading.showDialogLoading(context: context);
            } else if (state is FavoriteAddToCartErrorState) {
              Navigator.pop(context);
              CustomDialog.showCustomDialog(
                type: DialogType.error,
                context: context,
                title: 'Add to Cart',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is FavoriteAddToCartSuccessState) {
              Navigator.pop(context);
              CustomDialog.showCustomDialog(
                type: DialogType.success,
                context: context,
                title: 'Add to Cart',
                description: 'Add to cart successfuly.',
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<FavoriteCubit>();
            if (state is FavoriteLoadingState) {
              return CustomLoadingData();
            } else if (state is FavoriteErrorState) {
              return Center(child: Text(state.errorMessage));
            }
            return CustomRefreshIndicator(
              onRefresh: () async {
                await cubit.refreshFavorite();
              },
              child: cubit.favoriteList.isEmpty
                  ? Center(
                      child: Text('Your favourite is empty. Start shopping!'),
                    )
                  : _FavouriteGrid(),
            );
          },
        ),
      ),
    );
  }
}
