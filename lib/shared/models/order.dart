import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto/order.freezed.dart';
part 'auto/order.g.dart';

@freezed
sealed class Order with _$Order {
  const factory Order({
    required int id,
    String? orderDate,
    double? totalAmount,
    String? shippingAddress,
    List<Product>? items,

}) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
