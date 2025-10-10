import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto/cart.freezed.dart';
part 'auto/cart.g.dart';

@freezed
sealed class Cart with _$Cart {
  const factory Cart({
    required int id,
    required String title,
    required double price,
    String? description,
    String? category,
    String? image,
    required int quantity,
}) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
