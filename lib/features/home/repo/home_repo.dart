import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/categories/response_categories.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/model/sales/response_sales.dart';
import 'package:shoply_app/core/useecase/categories/categories_usecase.dart';
import 'package:shoply_app/core/useecase/products/products_usecase.dart';
import 'package:shoply_app/core/useecase/sales/sales_usecase.dart';

class HomeRepo {
  final _categoriesUsecase = CategoriesUsecase();
  final _productUsecase = ProductsUsecase();
  final _salesUseCase = SalesUsecase();
  Future<Either<String, List<ResponseCategories>>> getCategories() async {
    return await _categoriesUsecase.getCategories();
  }

  Future<Either<String, List<ResponseProducts>>> getTrendingProducts() async {
    return await _productUsecase.getTrendingProducts();
  }

  Future<Either<String, List<ResponseSales>>> getSales() async {
    return await _salesUseCase.getSales();
  }
}
