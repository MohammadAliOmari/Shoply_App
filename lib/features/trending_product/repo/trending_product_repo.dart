import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/model/products/response_products.dart';
import 'package:shoply_app/core/useecase/products/products_usecase.dart';

class TrendingProductRepo {
  final _productsUsecase = ProductsUsecase();

  Future<Either<String, List<ResponseProducts>>> getTrendingProducts() async {
    return await _productsUsecase.getTrendingProducts();
  }
}
