// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Order {

 int get id; String? get orderDate; double? get totalAmount; String? get shippingAddress; List<Product>? get items;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderDate,totalAmount,shippingAddress,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'Order(id: $id, orderDate: $orderDate, totalAmount: $totalAmount, shippingAddress: $shippingAddress, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 int id, String? orderDate, double? totalAmount, String? shippingAddress, List<Product>? items
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderDate = freezed,Object? totalAmount = freezed,Object? shippingAddress = freezed,Object? items = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderDate: freezed == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double?,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Product>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? orderDate,  double? totalAmount,  String? shippingAddress,  List<Product>? items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.orderDate,_that.totalAmount,_that.shippingAddress,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? orderDate,  double? totalAmount,  String? shippingAddress,  List<Product>? items)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.orderDate,_that.totalAmount,_that.shippingAddress,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? orderDate,  double? totalAmount,  String? shippingAddress,  List<Product>? items)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.orderDate,_that.totalAmount,_that.shippingAddress,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({required this.id, this.orderDate, this.totalAmount, this.shippingAddress, final  List<Product>? items}): _items = items;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  int id;
@override final  String? orderDate;
@override final  double? totalAmount;
@override final  String? shippingAddress;
 final  List<Product>? _items;
@override List<Product>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderDate,totalAmount,shippingAddress,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'Order(id: $id, orderDate: $orderDate, totalAmount: $totalAmount, shippingAddress: $shippingAddress, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 int id, String? orderDate, double? totalAmount, String? shippingAddress, List<Product>? items
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderDate = freezed,Object? totalAmount = freezed,Object? shippingAddress = freezed,Object? items = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderDate: freezed == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double?,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Product>?,
  ));
}


}

// dart format on
