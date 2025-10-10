import 'package:blink/core/error/failure.dart';
import 'package:blink/core/usecase/usecase.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductListUseCase extends UseCase<List<Product>, String> {
  final ProductRepository repo;

  ProductListUseCase(this.repo);

  @override
  Future<Either<Failure, List<Product>>> call(String params) async {
    return await repo.getProducts();
  }
}
