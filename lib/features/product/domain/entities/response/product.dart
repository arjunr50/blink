import 'package:blink/core/controller/common_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'auto/product.freezed.dart';

part 'auto/product.g.dart';

@freezed
sealed class Product with _$Product {
  const Product._();

  const factory Product({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
    int? orderQuantity,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  int get availableQuantity {
    const int initialStock = 50;

    final orders =
        GetIt.instance<CommonController>().orders.value;

    final orderedQty = orders.fold<int>(
      0,
      (sum, order) =>
          sum +
          (order.items
                  ?.where((item) => item.id == id)
                  .fold<int>(
                    0,
                    (pSum, item) => pSum + (item.orderQuantity ?? 0),
                  ) ??
              0),
    );
    return (initialStock - orderedQty)
        .clamp(0, initialStock)
        .toInt(); // Add .toInt() here
  }
}

@freezed
sealed class Rating with _$Rating {
  const factory Rating({double? rate, int? count}) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
