import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/categories/response_categories.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/features/home/repo/home_repo.dart';
import 'package:shoply_app/features/home/view_model/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());
  final _homeRepo = HomeRepo();

  final List<ResponseCategories> ressponseCategories = [];
  final List<ResponseProducts> responseProducts = [];
  String? _errorMessage;

  Future<void> getHome() async {
    emit(HomeLoadingState());
    await Future.wait([_getCategories(), _getTrendingProducts()]);
    if (_errorMessage != null) {
      emit(HomeErrorState(errorMessage: _errorMessage ?? ''));
    } else {
      emit(HomeSuccessState());
    }
  }

  Future<void> _getCategories() async {
    emit(HomeLoadingState());
    final result = await _homeRepo.getCategories();
    result.fold(
      (errorMessage) {
        _errorMessage = errorMessage;
        emit(HomeErrorState(errorMessage: errorMessage));
      },
      (ressponseCategories) {
        this.ressponseCategories.addAll(ressponseCategories);
        emit(HomeSuccessState());
      },
    );
  }

  Future<void> _getTrendingProducts() async {
    final result = await _homeRepo.getTrendingProducts();
    result.fold(
      (errorMessage) {
        _errorMessage = errorMessage;
      },
      (responseProducts) {
        this.responseProducts.addAll(responseProducts);
      },
    );
  }
}
