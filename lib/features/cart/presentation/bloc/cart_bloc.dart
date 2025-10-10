import 'package:auto_route/auto_route.dart';
import 'package:blink/app/routes/app_router.gr.dart';
import 'package:blink/core/controller/common_controller.dart';
import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/core/utils/notification_service.dart';
import 'package:blink/features/cart/presentation/widgets/cart_item.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/shared/models/order.dart';
import 'package:blink/shared/widgets/common_button.dart';
import 'package:blink/shared/widgets/no_data_widget.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';
part 'package:blink/features/cart/presentation/pages/cart_page.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState.initial()) {
    on<CartEvent>((event, emit) {
    });
  }
}
