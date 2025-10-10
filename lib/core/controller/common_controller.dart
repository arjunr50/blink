import 'dart:convert';

import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/shared/models/order.dart';
import 'package:blink/shared/widgets/custom_dialogs.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class CommonController {
  final String baseUrl;
  final storage = GetStorage();
  ValueNotifier<List<Order>> orders = ValueNotifier([]);
  ValueNotifier<List<Product>> cartNotifier = ValueNotifier([]);

  CommonController({required this.baseUrl}) {
    _loadCartFromStorage();
    _loadOrdersFromStorage();
  }

  void addOrder(Order order) {
    final updatedOrders = List<Order>.from(orders.value);
    updatedOrders.add(order);
    orders.value = updatedOrders;
    _saveOrdersToStorage();
  }

  void clearOrders() {
    orders.value = [];
    _saveOrdersToStorage();
  }

  void _saveOrdersToStorage() {
    final jsonString = jsonEncode(orders.value.map((o) => o.toJson()).toList());
    storage.write('orders', jsonString);
  }

  void _loadOrdersFromStorage() {
    final jsonString = storage.read('orders');
    if (jsonString != null) {
      final List<dynamic> decoded = jsonDecode(jsonString);
      orders.value = decoded.map((e) => Order.fromJson(e)).toList();
    } else {
      orders.value = [];
    }
  }

  void _loadCartFromStorage() {
    final jsonString = storage.read('cartItems');
    if (jsonString != null) {
      final List<dynamic> decoded = jsonDecode(jsonString);
      cartNotifier.value = decoded.map((e) => Product.fromJson(e)).toList();
    }
  }

  void _saveCartToStorage() {
    final jsonString = jsonEncode(
      cartNotifier.value.map((e) => e.toJson()).toList(),
    );
    storage.write('cartItems', jsonString);
  }

  int availableQuantity(Product product) {
    const int initialStock = 50;

    int orderedQty = 0;
    final currentOrders = orders.value;
    for (final order in currentOrders) {
      if (order.items != null) {
        for (final item in order.items!) {
          if (item.id == product.id) {
            orderedQty += item.orderQuantity ?? 1;
          }
        }
      }
    }

    final available = initialStock - orderedQty;
    return available > 0 ? available : 0;
  }

  void addToCart(Product product) {
    final items = List<Product>.from(cartNotifier.value);
    final index = items.indexWhere((item) => item.id == product.id);

    int available = availableQuantity(product);

    if (index == -1) {
      if (available > 0) {
        final newProduct = product.copyWith(orderQuantity: 1);
        items.add(newProduct);
      } else {
        CustomDialogs.showErrorDialog(
          text: 'Out of Stock',
          message: 'This product is out of stock.',
        );
        return;
      }
    } else {
      final currentQty = items[index].orderQuantity ?? 1;
      if (currentQty < available) {
        final updatedProduct = items[index].copyWith(
          orderQuantity: currentQty + 1,
        );
        items[index] = updatedProduct;
      } else {
        CustomDialogs.showErrorDialog(
          text: 'Reached max stock limit',
          message: 'Maximum available stock reached for this product.',
        );
        return;
      }
    }

    cartNotifier.value = items;
    _saveCartToStorage();
  }

  void removeFromCart(Product product) {
    final items = List<Product>.from(cartNotifier.value);
    final index = items.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      final currentQty = items[index].orderQuantity ?? 1;
      if (currentQty > 1) {
        final updatedProduct = items[index].copyWith(
          orderQuantity: currentQty - 1,
        );
        items[index] = updatedProduct;
      } else {
        items.removeAt(index);
      }

      cartNotifier.value = items;
      _saveCartToStorage();
    }
  }

  void removeProductFromCart(Product product) {
    final items = List<Product>.from(cartNotifier.value);
    items.removeWhere((item) => item.id == product.id);
    cartNotifier.value = items;
    _saveCartToStorage();
  }
}
