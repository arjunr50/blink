import 'package:blink/core/controller/common_controller.dart';
import 'package:get_it/get_it.dart';

enum EndPoint {
  products,
  productDetail,
  cartCreate,
  cartDetails,
  cartUpdate,
  cartDelete,
}

extension UrlExtension on EndPoint {
  String get url {
    final baseUrl = GetIt.instance<CommonController>().baseUrl;
    switch (this) {
      case EndPoint.products:
        return '$baseUrl/products';
      case EndPoint.productDetail:
        return '$baseUrl/products/{id}';
      case EndPoint.cartCreate:
        return '$baseUrl/carts';
      case EndPoint.cartDetails:
        return '$baseUrl/carts';
      case EndPoint.cartUpdate:
        return '$baseUrl/carts';
      case EndPoint.cartDelete:
        return '$baseUrl/carts';
    }
  }

  String urlWithParams(Map<String, dynamic> params) {
    var urlStr = url;
    params.forEach((key, value) {
      urlStr = urlStr.replaceAll('{$key}', value.toString());
    });
    return urlStr;
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    switch (this) {
      case EndPoint.cartCreate:
        return RequestType.post;
      case EndPoint.cartDetails:
        return RequestType.get;
      case EndPoint.cartUpdate:
        return RequestType.put;
      case EndPoint.cartDelete:
        return RequestType.delete;
      default:
        return RequestType.get;
    }
  }
}

enum RequestType { get, post, put, patch, delete }
