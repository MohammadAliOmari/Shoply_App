import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/categories/response_categories.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/useecase/categories/categories_usecase.dart';
import 'package:shoply_app/core/useecase/products/products_usecase.dart';

class HomeRepo {
  final _categoriesUsecase = CategoriesUsecase();
  final _productUsecase = ProductsUsecase();
  Future<Either<String, List<ResponseCategories>>> getCategories() async {
    return await _categoriesUsecase.getCategories();
  }

  Future<Either<String, List<ResponseProducts>>> getTrendingProducts() async {
    return await _productUsecase.getTrendingProducts();
  }
}
