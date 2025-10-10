// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  description: json['description'] as String?,
  category: json['category'] as String?,
  image: json['image'] as String?,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'description': instance.description,
  'category': instance.category,
  'image': instance.image,
  'quantity': instance.quantity,
};
