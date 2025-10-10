// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:blink/features/cart/presentation/bloc/cart_bloc.dart' as _i1;
import 'package:blink/features/order/presentation/pages/order_page.dart' as _i3;
import 'package:blink/features/product/domain/entities/response/product.dart'
    as _i7;
import 'package:blink/features/product/presentation/bloc/product_bloc.dart'
    as _i4;
import 'package:blink/features/product/presentation/pages/home_page.dart'
    as _i2;
import 'package:collection/collection.dart' as _i8;
import 'package:flutter/material.dart' as _i6;

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i5.PageRouteInfo<void> {
  const CartRoute({List<_i5.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.CartPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i6.Key? key,
    int? selectedIndex,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(key: key, selectedIndex: selectedIndex),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return _i5.WrappedRoute(
        child: _i2.HomePage(key: args.key, selectedIndex: args.selectedIndex),
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.selectedIndex});

  final _i6.Key? key;

  final int? selectedIndex;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, selectedIndex: $selectedIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key && selectedIndex == other.selectedIndex;
  }

  @override
  int get hashCode => key.hashCode ^ selectedIndex.hashCode;
}

/// generated route for
/// [_i3.OrderPage]
class OrderRoute extends _i5.PageRouteInfo<OrderRouteArgs> {
  OrderRoute({_i6.Key? key, List<_i5.PageRouteInfo>? children})
    : super(
        OrderRoute.name,
        args: OrderRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'OrderRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderRouteArgs>(
        orElse: () => const OrderRouteArgs(),
      );
      return _i3.OrderPage(key: args.key);
    },
  );
}

class OrderRouteArgs {
  const OrderRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'OrderRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrderRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i4.ProductDetailPage]
class ProductDetailRoute extends _i5.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i6.Key? key,
    required _i7.Product product,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         ProductDetailRoute.name,
         args: ProductDetailRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailRouteArgs>();
      return _i4.ProductDetailPage(key: args.key, product: args.product);
    },
  );
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({this.key, required this.product});

  final _i6.Key? key;

  final _i7.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailRouteArgs) return false;
    return key == other.key && product == other.product;
  }

  @override
  int get hashCode => key.hashCode ^ product.hashCode;
}

/// generated route for
/// [_i4.ProductPage]
class ProductRoute extends _i5.PageRouteInfo<void> {
  const ProductRoute({List<_i5.PageRouteInfo>? children})
    : super(ProductRoute.name, initialChildren: children);

  static const String name = 'ProductRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.WrappedRoute(child: const _i4.ProductPage());
    },
  );
}

/// generated route for
/// [_i4.ProductSearchPage]
class ProductSearchRoute extends _i5.PageRouteInfo<ProductSearchRouteArgs> {
  ProductSearchRoute({
    _i6.Key? key,
    required List<_i7.Product> products,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         ProductSearchRoute.name,
         args: ProductSearchRouteArgs(key: key, products: products),
         initialChildren: children,
       );

  static const String name = 'ProductSearchRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductSearchRouteArgs>();
      return _i5.WrappedRoute(
        child: _i4.ProductSearchPage(key: args.key, products: args.products),
      );
    },
  );
}

class ProductSearchRouteArgs {
  const ProductSearchRouteArgs({this.key, required this.products});

  final _i6.Key? key;

  final List<_i7.Product> products;

  @override
  String toString() {
    return 'ProductSearchRouteArgs{key: $key, products: $products}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductSearchRouteArgs) return false;
    return key == other.key &&
        const _i8.ListEquality().equals(products, other.products);
  }

  @override
  int get hashCode => key.hashCode ^ const _i8.ListEquality().hash(products);
}
