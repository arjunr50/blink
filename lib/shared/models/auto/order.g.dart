// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: (json['id'] as num).toInt(),
  orderDate: json['orderDate'] as String?,
  totalAmount: (json['totalAmount'] as num?)?.toDouble(),
  shippingAddress: json['shippingAddress'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'orderDate': instance.orderDate,
  'totalAmount': instance.totalAmount,
  'shippingAddress': instance.shippingAddress,
  'items': instance.items,
};
