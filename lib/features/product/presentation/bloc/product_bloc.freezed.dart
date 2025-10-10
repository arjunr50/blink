// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetProducts value)?  getProducts,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetProducts() when getProducts != null:
return getProducts(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetProducts value)  getProducts,}){
final _that = this;
switch (_that) {
case _GetProducts():
return getProducts(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetProducts value)?  getProducts,}){
final _that = this;
switch (_that) {
case _GetProducts() when getProducts != null:
return getProducts(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getProducts,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetProducts() when getProducts != null:
return getProducts();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getProducts,}) {final _that = this;
switch (_that) {
case _GetProducts():
return getProducts();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getProducts,}) {final _that = this;
switch (_that) {
case _GetProducts() when getProducts != null:
return getProducts();case _:
  return null;

}
}

}

/// @nodoc


class _GetProducts implements ProductEvent {
  const _GetProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.getProducts()';
}


}




/// @nodoc
mixin _$ProductState {

 dynamic get productListInProgress; dynamic get productListSuccess; List<Product>? get products; Failure? get productListFailed;
/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductStateCopyWith<ProductState> get copyWith => _$ProductStateCopyWithImpl<ProductState>(this as ProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState&&const DeepCollectionEquality().equals(other.productListInProgress, productListInProgress)&&const DeepCollectionEquality().equals(other.productListSuccess, productListSuccess)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.productListFailed, productListFailed) || other.productListFailed == productListFailed));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(productListInProgress),const DeepCollectionEquality().hash(productListSuccess),const DeepCollectionEquality().hash(products),productListFailed);

@override
String toString() {
  return 'ProductState(productListInProgress: $productListInProgress, productListSuccess: $productListSuccess, products: $products, productListFailed: $productListFailed)';
}


}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res>  {
  factory $ProductStateCopyWith(ProductState value, $Res Function(ProductState) _then) = _$ProductStateCopyWithImpl;
@useResult
$Res call({
 dynamic productListInProgress, dynamic productListSuccess, List<Product>? products, Failure? productListFailed
});




}
/// @nodoc
class _$ProductStateCopyWithImpl<$Res>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._self, this._then);

  final ProductState _self;
  final $Res Function(ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productListInProgress = freezed,Object? productListSuccess = freezed,Object? products = freezed,Object? productListFailed = freezed,}) {
  return _then(_self.copyWith(
productListInProgress: freezed == productListInProgress ? _self.productListInProgress : productListInProgress // ignore: cast_nullable_to_non_nullable
as dynamic,productListSuccess: freezed == productListSuccess ? _self.productListSuccess : productListSuccess // ignore: cast_nullable_to_non_nullable
as dynamic,products: freezed == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>?,productListFailed: freezed == productListFailed ? _self.productListFailed : productListFailed // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,){
final _that = this;
switch (_that) {
case _Initial():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic productListInProgress,  dynamic productListSuccess,  List<Product>? products,  Failure? productListFailed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.productListInProgress,_that.productListSuccess,_that.products,_that.productListFailed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic productListInProgress,  dynamic productListSuccess,  List<Product>? products,  Failure? productListFailed)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.productListInProgress,_that.productListSuccess,_that.products,_that.productListFailed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic productListInProgress,  dynamic productListSuccess,  List<Product>? products,  Failure? productListFailed)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.productListInProgress,_that.productListSuccess,_that.products,_that.productListFailed);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductState {
  const _Initial({this.productListInProgress = false, this.productListSuccess = false, final  List<Product>? products, this.productListFailed}): _products = products;
  

@override@JsonKey() final  dynamic productListInProgress;
@override@JsonKey() final  dynamic productListSuccess;
 final  List<Product>? _products;
@override List<Product>? get products {
  final value = _products;
  if (value == null) return null;
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Failure? productListFailed;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other.productListInProgress, productListInProgress)&&const DeepCollectionEquality().equals(other.productListSuccess, productListSuccess)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.productListFailed, productListFailed) || other.productListFailed == productListFailed));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(productListInProgress),const DeepCollectionEquality().hash(productListSuccess),const DeepCollectionEquality().hash(_products),productListFailed);

@override
String toString() {
  return 'ProductState(productListInProgress: $productListInProgress, productListSuccess: $productListSuccess, products: $products, productListFailed: $productListFailed)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 dynamic productListInProgress, dynamic productListSuccess, List<Product>? products, Failure? productListFailed
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productListInProgress = freezed,Object? productListSuccess = freezed,Object? products = freezed,Object? productListFailed = freezed,}) {
  return _then(_Initial(
productListInProgress: freezed == productListInProgress ? _self.productListInProgress : productListInProgress // ignore: cast_nullable_to_non_nullable
as dynamic,productListSuccess: freezed == productListSuccess ? _self.productListSuccess : productListSuccess // ignore: cast_nullable_to_non_nullable
as dynamic,products: freezed == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>?,productListFailed: freezed == productListFailed ? _self.productListFailed : productListFailed // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
