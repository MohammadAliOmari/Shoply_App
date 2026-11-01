import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/features/trending_product/repo/trending_product_repo.dart';
import 'package:shoply_app/features/trending_product/view_model/state.dart';

class TrendingProductCubit extends Cubit<TrendingProductState> {
  TrendingProductCubit() : super(TrendingProductInitState());
  final trendingProductRepo = TrendingProductRepo();
  final List<ResponseProducts> products = [];

  Future<void> refreshData() async {
    products.clear();
    await getTrendingProducts();
  }

  Future<void> getTrendingProducts() async {
    emit(TrendingProductLoadingState());
    final result = await trendingProductRepo.getTrendingProducts();
    products.clear();
    result.fold(
      (failure) {
        emit(TrendingProductErrorState(errorMessage: failure));
      },
      (responseProducts) {
        products.addAll(responseProducts);
        emit(TrendingProductSuccessState());
      },
    );
  }
}
