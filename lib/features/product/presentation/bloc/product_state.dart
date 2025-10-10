part of 'product_bloc.dart';

@freezed
sealed class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) productListInProgress,
    @Default(false) productListSuccess,
    List<Product>? products,
    Failure? productListFailed
}) = _Initial;
}
