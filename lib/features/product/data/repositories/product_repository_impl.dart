import 'package:blink/core/error/failure.dart';
import 'package:blink/core/services/dio_client.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/features/product/domain/repositories/product_repository.dart';
import 'package:blink/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final DioClient dio;

  ProductRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final response = await dio.request(endPoint: EndPoint.products);

      if (response.data != null) {
        final productsJson = response.data as List;
        final products = productsJson
            .map((json) => Product.fromJson(json))
            .toList();
        return Right(products);
      } else {
        return Left(
          Failure(response.statusCode.toString(), response.description ?? ""),
        );
      }
    } catch (e) {
      return Left(Failure("900", e.toString()));
    }
  }
}
