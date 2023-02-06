import 'dart:developer';
import 'package:dio/dio.dart';

import 'products_repository.dart';
import '../../models/product_model.dart';
import '../../core/config/client/custom_dio.dart';
import '../../core/exceptions/repository_exception.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;

  ProductsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>(
            (item) => ProductModel.fromMap(item),
          )
          .toList();
    } on DioError catch (error, stack) {
      log(
        'Error get list product',
        error: error,
        stackTrace: stack,
      );
      throw RepositoryException(message: 'Error get list product');
    }
  }
}
