import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/categories/response_categories.dart';
import 'package:shoply_app/core/useecase/categories/categories_usecase.dart';

class CategoriesRepo {
  final _categoriesUsecase = CategoriesUsecase();

  Future<Either<String, List<ResponseCategories>>> getCategories() async {
    return await _categoriesUsecase.getCategories();
  }
}
