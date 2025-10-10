import 'package:blink/core/error/failure.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
