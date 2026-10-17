import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/model/categories/response_categories.dart';
import 'package:shoply_app/features/categories/repo/categories_repo.dart';
import 'package:shoply_app/features/categories/view_model/state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitState());

  final _categoriesRepo = CategoriesRepo();
  final List<ResponseCategories> ressponseCategories = [];

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    final result = await _categoriesRepo.getCategories();
    result.fold(
      (errorMessage) {
        emit(CategoriesErrorState(errorMassege: errorMessage));
      },
      (ressponseCategories) {
        this.ressponseCategories.addAll(ressponseCategories);
        emit(CategoriesSucsessState());
      },
    );
  }

  Future<void> refreshCategories() async {
    ressponseCategories.clear();
    await getCategories();
  }
}
